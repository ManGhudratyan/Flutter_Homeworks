part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState({this.error, this.userId});
  final String? error;
  final String? userId;

  @override
  List<Object?> get props => [error, userId];
}

final class AuthInitial extends AuthState {}

final class AuthUserLoading extends AuthState {}

final class AuthFailed extends AuthState {
  const AuthFailed(String error) : super(error: error);
}

final class AuthUserLoaded extends AuthState {
  const AuthUserLoaded(String userId) : super(userId: userId);
}
