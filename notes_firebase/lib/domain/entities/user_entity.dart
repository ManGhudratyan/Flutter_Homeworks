import '../../data/models/user_model.dart';

class UserEntity {
  UserEntity({
    this.email,
    this.userId,
    this.password,
  });
  factory UserEntity.fromModel(UserModel userModel) {
    return UserEntity(
      userId: userModel.userId,
      email: userModel.email,
      password: userModel.password,
    );
  }

  UserModel toModel() {
    return UserModel(userId: userId, email: email, password: password);
  }

  final String? email;
  String? userId;
  final String? password;
}
