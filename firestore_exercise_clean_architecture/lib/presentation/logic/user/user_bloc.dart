// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/enum/gender.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/user_service/user_service_imp.dart';
import '../../../domain/entities/user_entity.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.userServiceImp) : super(UserInitial()) {
    on<AddUserToDbEvent>(_mapAddUserToDbEventToState);
    on<AddUserModelEvent>(_mapAddUserModelEventToState);
    on<UpdateEmailEvent>(_mapUpdateEmailEventToState);
    on<UpdateNameEvent>(_mapUpdateNameEventToState);
    on<UpdateBirthdayEvent>(_mapUpdateBirthdayEventToState);
    on<UpdateGenderEvent>(_mapUpdateGenderEventToState);
    on<SubmitUserEvent>(_mapSubmitUserEventToState);
    on<SignOutEvent>(_mapSignOutEventToState);
    on<GetUserByIdEvent>(_mapGetUserByIdEventToState);
    on<DeleteUserFromDbEvent>(_mapDeleteUserFromDbEventToState);
    on<GetUsersCollectionEvent>(_mapGetUsersCollectionEventToState);
    // on<GetUserCollectionEvent>(_mapGetUserCollectionEventToState);
  }

  final UserServiceImp userServiceImp;

  FutureOr<void> _mapAddUserToDbEventToState(
      AddUserToDbEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading(state));
      await userServiceImp.saveUserToDB(event.userEntity.toModel());
      final UserEntity userModel =
          await userServiceImp.getUserById(event.userEntity.userId ?? '');
      emit(UserLoaded(userModel));
    } catch (e) {
      emit(UserFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapAddUserModelEventToState(
      AddUserModelEvent event, Emitter<UserState> emit) {
    emit(UserLoaded(event.userEntity));
  }

  FutureOr<void> _mapUpdateEmailEventToState(
      UpdateEmailEvent event, Emitter<UserState> emit) {
    emit(UserDataUpdated(state, email: event.email));
  }

  FutureOr<void> _mapUpdateNameEventToState(
      UpdateNameEvent event, Emitter<UserState> emit) {
    emit(UserDataUpdated(state, name: event.name));
  }

  FutureOr<void> _mapUpdateBirthdayEventToState(
      UpdateBirthdayEvent event, Emitter<UserState> emit) {
    emit(UserDataUpdated(state, birthday: event.birthday));
  }

  FutureOr<void> _mapUpdateGenderEventToState(
      UpdateGenderEvent event, Emitter<UserState> emit) {
    emit(UserDataUpdated(state, gender: event.gender));
  }

  FutureOr<void> _mapSubmitUserEventToState(
      SubmitUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading(state));
      await userServiceImp.saveUserToDB(event.userModel.toModel());
      emit(UserLoaded(event.userModel));
    } catch (e) {
      emit(UserFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapSignOutEventToState(
      SignOutEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading(state));
      await userServiceImp.signOut();
      emit(UserStateSignedOut());
    } on FirebaseAuthException catch (error) {
      emit(UserFailed(state, error.toString()));
    }
  }

  FutureOr<void> _mapGetUserByIdEventToState(
      GetUserByIdEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading(state));
      final UserEntity userModel =
          await userServiceImp.getUserById(event.userId);
      emit(UserLoaded(userModel));
    } catch (e) {
      emit(UserFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapDeleteUserFromDbEventToState(
      DeleteUserFromDbEvent event, Emitter<UserState> emit) async {
    try {
      final userModel = UserEntity(
        userId: event.userId,
      );
      await userServiceImp.deleteUserFromDB(userModel.userId ?? '');
    } on FirebaseAuthException catch (error) {
      emit(UserFailed(state, error.toString()));
    }
  }

  FutureOr<void> _mapGetUsersCollectionEventToState(
      GetUsersCollectionEvent event, Emitter<UserState> emit) async {
    try {
      await for (final snapshot in userServiceImp.getUsersFromCollection()) {
        final users =
            snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
        emit(GetUsersLoaded(users));
      }
    } catch (error) {
      emit(UserFailed(state, error.toString()));
    }
  }

  // FutureOr<void> _mapGetUserCollectionEventToState(
  //     GetUserCollectionEvent event, Emitter<UserState> emit) async {
  //   try {
  //     await for (var snapshot in userServiceImp.getUserFromCollection(event.userId)) {
  //       final user = UserModel.fromJson(snapshot.data() ?? {});

  //       emit(GetUsersLoaded(users));
  //     }
  //   } catch (error) {
  //     emit(UserFailed(state, error.toString()));
  //   }
  // }
}
