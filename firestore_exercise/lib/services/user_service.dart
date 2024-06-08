import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_exercise/models/user_model.dart';

typedef FDocumentSnapshot = DocumentSnapshot<Map<String, dynamic>>;

class UserService {
  final FirebaseFirestore firebaseFirestore;

  UserService({required this.firebaseFirestore});

  Future<void> saveUserToDB(UserModel userModel) async {
    await firebaseFirestore
        .collection('users')
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<UserModel> getUserById(String userId) async {
    final FDocumentSnapshot snapshot =
        await firebaseFirestore.collection('users').doc(userId).get();
    if (snapshot.exists && snapshot.data() != null) {
      return UserModel.fromJson(snapshot.data()!);
    }
    throw Exception('User doesn\'t exist');
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
