import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_firebase/models/user_model.dart';

class AddDbService {
  AddDbService(this.firebaseFirestore);
  final FirebaseFirestore firebaseFirestore;

  Future<void> saveUserToDB(UserModel userModel) async {
    await firebaseFirestore
        .collection('contacts')
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}
