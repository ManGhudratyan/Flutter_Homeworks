part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class SignInEvent extends AuthEvent {
  const SignInEvent(this.email, this.password);
  final String email;
  final String password;
}

final class SignInWithGoogleEvent extends AuthEvent {}

// final class SignUpEvent extends AuthEvent {
//   const SignUpEvent(this.email, this.password);
//   final String email;
//   final String password;
// }

final class SignOutEvent extends AuthEvent {}

final class SignedOutEvent extends AuthEvent {}

final class SignUpEvent extends AuthEvent {
  const SignUpEvent(this.email, this.password);
  final String email;
  final String password;
}
