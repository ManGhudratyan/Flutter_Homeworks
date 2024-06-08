import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_exercise/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authService) : super(const AuthInitial()) {
    on<SignInEvent>(_mapSignInEventToState);
    on<SignOutEvent>(_mapSignOutEventToState);
    on<SignInWithGoogleEvent>(_mapSignInWithGoogleEventToState);
    on<SignUpEvent>(_mapSignUpEventToState);
  }

  final AuthService authService;

  FutureOr<void> _mapSignInEventToState(
      SignInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthUserLoading());
      final UserCredential userCredential =
          await authService.signInUserViaEmail(
        event.email,
        event.password,
      );
      emit(AuthUserLoaded(userCredential.user?.uid ?? ''));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          emit(const AuthStateFailed('The email address is not valid.'));
          break;
        case 'user-disabled':
          emit(const AuthStateFailed('The user has been disabled.'));
          break;
        case 'user-not-found':
          emit(const AuthStateFailed('No user found for that email.'));
          break;
        case 'wrong-password':
          emit(const AuthStateFailed('Wrong password provided.'));
          break;
        default:
          emit(AuthStateFailed(e.message ?? 'An unknown error occurred.'));
      }
    } catch (e) {
      emit(AuthStateFailed(e.toString()));
    }
  }

  FutureOr<void> _mapSignInWithGoogleEventToState(
      SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthUserLoading());
      final UserCredential userCredential =
          await authService.signInWithGoogle();
      emit(AuthUserLoaded(userCredential.user?.uid ?? ''));
    } on FirebaseAuthException catch (e) {
      emit(AuthStateFailed(e.message ?? e.code));
    } catch (e) {
      emit(AuthStateFailed(e.toString()));
    }
  }

  FutureOr<void> _mapSignOutEventToState(
      SignOutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthUserLoading());
      await authService.signOut();
      emit(AuthStateSignedOut());
    } on FirebaseAuthException catch (e) {
      emit(AuthStateFailed(e.message ?? e.code));
    } catch (e) {
      emit(AuthStateFailed(e.toString()));
    }
  }

  FutureOr<void> _mapSignUpEventToState(
      SignUpEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthUserLoading());
      final UserCredential userCredential =
          await authService.signUpUserViaEmail(event.email, event.password);
      emit(AuthRegistered(userCredential.user?.uid ?? ''));
    } on FirebaseAuthException catch (error) {
      emit(AuthStateFailed(error.message ?? error.toString()));
    }
  }
}
