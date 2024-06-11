import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user_model.dart';

import 'user_service.dart';

class UserServiceImp implements UserService {
  UserServiceImp({required this.firebaseFirestore});
  final FirebaseFirestore firebaseFirestore;

  @override
  Future<void> saveUserToDB(UserModel userModel) async {
    await firebaseFirestore
        .collection('users')
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  @override
  Future<UserModel> getUserById(String userId) async {
    final snapshot =
        await firebaseFirestore.collection('users').doc(userId).get();
    if (snapshot.exists && snapshot.data() != null) {
      return UserModel.fromJson(snapshot.data()!);
    }
    throw Exception("User doesn't exist");
  }

  @override
  Future<void> deleteUserFromDB(String userId) async {
    await firebaseFirestore.collection('users').doc(userId).delete();
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsersFromCollection() {
    return FirebaseFirestore.instance.collection('users').snapshots();
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserFromCollection(
      String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots();
  }
}
