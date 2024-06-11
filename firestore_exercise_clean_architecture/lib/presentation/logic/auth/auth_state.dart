part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState({
    this.error,
    this.userId,
  });
  final String? error;
  final String? userId;
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthUserLoading extends AuthState {}

final class AuthUserLoaded extends AuthState {
  const AuthUserLoaded(String userId) : super(userId: userId);
}

final class AuthStateFailed extends AuthState {
  const AuthStateFailed(String error) : super(error: error);
}

final class AuthStateSignedOut extends AuthState {}

final class AuthRegistered extends AuthState {
  const AuthRegistered(String userId) : super(userId : userId);
}
