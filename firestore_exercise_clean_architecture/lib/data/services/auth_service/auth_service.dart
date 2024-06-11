import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<UserCredential> signInUserViaEmail(String email, String password);
  Future<UserCredential> signUpUserViaEmail(String email, String password);
  Future<UserCredential> signInWithGoogle();
  Future<void> signOut();
}
