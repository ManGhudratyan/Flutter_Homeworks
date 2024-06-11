import '../entities/user_entity.dart';

abstract class UserRepositories {
  Future<void> saveUserToDB(UserEntity userEntity);
  Future<UserEntity> getUserById(String userId);
  Future<void> deleteUserFromDB(String userId);
  Future<void> signOut();
  // Stream<QuerySnapshot<Map<String, dynamic>>> getUsersFromCollection();
  // Stream<DocumentSnapshot<Map<String, dynamic>>> getUserFromCollection(
  //     String userId);
}
