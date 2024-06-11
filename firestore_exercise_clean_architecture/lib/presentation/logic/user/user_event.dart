part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AddUserToDbEvent extends UserEvent {
  const AddUserToDbEvent(this.userEntity);
  final UserEntity userEntity;
}

class AddUserModelEvent extends UserEvent {
  const AddUserModelEvent(this.userEntity);
  final UserEntity userEntity;
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
  final UserEntity userModel;
}

class SignOutEvent extends UserEvent {
  const SignOutEvent();
}

class GetUserByIdEvent extends UserEvent {

  const GetUserByIdEvent({required this.userId});
  final String userId;
}

class DeleteUserFromDbEvent extends UserEvent {
  const DeleteUserFromDbEvent(this.userId);
  final String userId;
}

class GetUsersCollectionEvent extends UserEvent {
  const GetUsersCollectionEvent();
}

class GetUserCollectionEvent extends UserEvent {
  const GetUserCollectionEvent(this.userId);
  final String userId;
}
