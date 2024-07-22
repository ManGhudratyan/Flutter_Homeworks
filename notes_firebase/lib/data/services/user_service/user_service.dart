import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user_model.dart';

abstract class UserService {
  Future<void> saveUserToDB(UserModel userModel);
  // Future<UserModel> getUserById(String userId);
  Future<UserCredential> signUpWithEmailAndPassword(UserModel userModel);
  Future<UserCredential> signInUserViaEmail(String email, String password);
}
