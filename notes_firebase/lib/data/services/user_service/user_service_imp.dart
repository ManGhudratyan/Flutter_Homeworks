import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user_model.dart';
import 'user_service.dart';

class UserServiceImp extends UserService {
  UserServiceImp(this.firebaseFirestore);
  final FirebaseFirestore firebaseFirestore;

  // @override
  // Future<UserModel> getUserById(String userId) async {
  //   final snapshot =
  //       await firebaseFirestore.collection('users_notes').doc(userId).get();
  //   if (snapshot.exists && snapshot.data() != null) {
  //     return UserModel.fromJson(snapshot.data()!);
  //   } else {
  //     throw Exception('User does not exist');
  //   }
  // }

  @override
  Future<void> saveUserToDB(UserModel userModel) async {
    await firebaseFirestore
        .collection('users_notes')
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  @override
  Future<UserCredential> signUpWithEmailAndPassword(UserModel userModel) async {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userModel.email ?? '',
      password: userModel.password ?? '',
    );
    return userCredential;
  }

  @override
  Future<UserCredential> signInUserViaEmail(
      String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }
}
