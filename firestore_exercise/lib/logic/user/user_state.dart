part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState(
      {this.email,
      this.name,
      this.birthday,
      this.gender,
      this.userModel,
      this.error});
  final UserModel? userModel;
  final String? error;
  final String? email;
  final String? name;
  final DateTime? birthday;
  final Gender? gender;

  @override
  List<Object?> get props => [
        error,
        userModel,
        email,
        name,
        birthday,
        gender,
      ];
}

final class UserInitial extends UserState {}

final class UserFailed extends UserState {
  UserFailed(UserState initialState, String error)
      : super(userModel: initialState.userModel, error: error);
}

final class UserLoading extends UserState {
  UserLoading(UserState initialState)
      : super(userModel: initialState.userModel);
}

final class UserLoaded extends UserState {
  const UserLoaded(UserModel model) : super(userModel: model);
}

final class UserModelState extends UserState {
  const UserModelState(UserModel model) : super(userModel: model);
}

class UserDataUpdated extends UserState {
  UserDataUpdated(
    UserState initState, {
    String? email,
    String? name,
    DateTime? birthday,
    Gender? gender,
  }) : super(
          email: email ?? initState.email,
          name: name ?? initState.name,
          birthday: birthday ?? initState.birthday,
          gender: gender ?? initState.gender,
        );
}

final class UserStateSignedOut extends UserState {}
