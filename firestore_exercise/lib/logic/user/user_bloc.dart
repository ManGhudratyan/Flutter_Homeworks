import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_exercise/models/user_model.dart';
import 'package:firestore_exercise/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.userService) : super(UserInitial()) {
    on<AddUserToDbEvent>(_mapAddUserToDbEventToState);
    on<AddUserModelEvent>(_mapAddUserModelEventToState);
    on<UpdateEmailEvent>(_mapUpdateEmailEventToState);
    on<UpdateNameEvent>(_mapUpdateNameEventToState);
    on<UpdateBirthdayEvent>(_mapUpdateBirthdayEventToState);
    on<UpdateGenderEvent>(_mapUpdateGenderEventToState);
    on<SubmitUserEvent>(_mapSubmitUserEventToState);
    on<SignOutEvent>(_mapSignOutEventToState);
    on<GetUserByIdEvent>(_mapGetUserByIdEventToState);
  }

  final UserService userService;

  FutureOr<void> _mapAddUserToDbEventToState(
      AddUserToDbEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading(state));
      await userService.saveUserToDB(event.userModel);
      final UserModel userModel =
          await userService.getUserById(event.userModel.userId ?? '');
      emit(UserLoaded(userModel));
    } catch (e) {
      emit(UserFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapAddUserModelEventToState(
      AddUserModelEvent event, Emitter<UserState> emit) {
    emit(UserLoaded(event.userModel));
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
      await userService.saveUserToDB(event.userModel);
      emit(UserLoaded(event.userModel));
    } catch (e) {
      emit(UserFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapSignOutEventToState(
      SignOutEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading(state));
      await userService.signOut();
      emit(UserStateSignedOut());
    } on FirebaseAuthException catch (error) {
      emit(UserFailed(state, error.toString()));
    }
  }

  FutureOr<void> _mapGetUserByIdEventToState(
      GetUserByIdEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading(state));
      final UserModel userModel = await userService.getUserById(event.userId);
      emit(UserLoaded(userModel));
    } catch (e) {
      emit(UserFailed(state, e.toString()));
    }
  }
}
