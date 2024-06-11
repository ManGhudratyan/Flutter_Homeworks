import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../models/user_model.dart';

typedef FDocumentSnapshot = DocumentSnapshot<Map<String, dynamic>>;
late final FirebaseDatabase firebaseDatabase;

abstract class UserService {
  Future<void> saveUserToDB(UserModel userModel);
  Future<UserModel> getUserById(String userId);
  Future<void> deleteUserFromDB(String userId);
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsersFromCollection();
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserFromCollection(
      String userId);
  Future<void> signOut();
}
