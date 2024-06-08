part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AddUserToDbEvent extends UserEvent {
  const AddUserToDbEvent(this.userModel);
  final UserModel userModel;
}

class AddUserModelEvent extends UserEvent {
  const AddUserModelEvent(this.userModel);
  final UserModel userModel;
}

class UpdateEmailEvent extends UserEvent {
  const UpdateEmailEvent(this.email);
  final String email;
}

class UpdateNameEvent extends UserEvent {
  const UpdateNameEvent(this.name);
  final String name;
}

class UpdateBirthdayEvent extends UserEvent {
  const UpdateBirthdayEvent(this.birthday);
  final DateTime birthday;
}

class UpdateGenderEvent extends UserEvent {
  const UpdateGenderEvent(this.gender);
  final Gender gender;
}

class SubmitUserEvent extends UserEvent {
  const SubmitUserEvent(this.userModel);
  final UserModel userModel;
}

class SignOutEvent extends UserEvent {
  const SignOutEvent();
}

class GetUserByIdEvent extends UserEvent {
  final String userId;

  const GetUserByIdEvent({required this.userId});
}
