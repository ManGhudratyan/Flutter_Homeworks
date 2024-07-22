import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/user_model.dart';
import '../../../data/services/user_service/user_service_imp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.userServiceImp) : super(AuthInitial()) {
    on<SignUpEvent>(_mapSignUpEventToState);
    on<SignInEvent>(_mapSignInEventToState);
  }

  final UserServiceImp userServiceImp;

  FutureOr<void> _mapSignUpEventToState(
      SignUpEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthUserLoading());
      final userModel = UserModel(email: event.email, password: event.password);
      final userCredential =
          await userServiceImp.signUpWithEmailAndPassword(userModel);
      userModel.userId = userCredential.user?.uid;
      emit(AuthUserLoaded(userModel.userId ?? ''));
    } catch (error) {
      emit(AuthFailed(error.toString()));
    }
  }

  FutureOr<void> _mapSignInEventToState(
      SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthUserLoading());
    final userCredential = await userServiceImp.signInUserViaEmail(
      event.email ?? '',
      event.password ?? '',
    );
    emit(AuthUserLoaded(userCredential.user?.uid ?? ''));
  }
}
