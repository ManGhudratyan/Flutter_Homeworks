import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../services/auth_service/auth_service.dart';
import '../services/user_service/user_service.dart';

class UserRepositoryImp implements UserRepositories {
  UserRepositoryImp({
    required this.userService,
    required this.authService,
  });

  final UserService userService;
  final AuthService authService;
  @override
  Future<void> deleteUserFromDB(String userId) {
    userService.deleteUserFromDB(userId);
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getUserById(String userId) {
    userService.getUserById(userId);
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserToDB(UserEntity userEntity) {
    userService.saveUserToDB(userEntity.toModel());
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // ignore: flutter_style_todos
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
