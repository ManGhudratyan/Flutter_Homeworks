import '../../data/models/user_model.dart';

class UserEntity {
  UserEntity({
    this.userId,
    this.email,
    this.name,
    this.birthday,
    this.gender,
  });
  
  factory UserEntity.fromModel(UserModel userModel) {
    return UserEntity(
      userId: userModel.userId,
      email: userModel.email,
      name: userModel.name,
      gender: userModel.gender,
      birthday: userModel.birthday,
    );
  }
  final String? userId;
  final String? email;
  final String? name;
  final DateTime? birthday;
  final String? gender;

  UserModel toModel() {
    return UserModel(
      userId: userId,
      email: email,
      name: name,
      gender: gender,
      birthday: birthday,
    );
  }
}
