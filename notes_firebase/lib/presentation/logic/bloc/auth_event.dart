part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent({this.email, this.password});
  final String? email;
  final String? password;

  @override
  List<Object?> get props => [email, password];
}

final class SignUpEvent extends AuthEvent {
  const SignUpEvent(String email, String password)
      : super(email: email, password: password);
}

final class SignInEvent extends AuthEvent {
  const SignInEvent(String email, String password)
      : super(email: email, password: password);
}
