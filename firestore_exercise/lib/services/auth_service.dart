import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<UserCredential> signInUserViaEmail(
      String email, String password) async {
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<UserCredential> signUpUserViaEmail(
      String email, String password) async {
    final UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? gAuth = await gUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth?.accessToken,
      idToken: gAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
