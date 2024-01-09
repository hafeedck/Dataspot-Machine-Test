import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  // user section
  static saveUser(String email, String gender, String name, String password,
      String uid) async {
    await FirebaseFirestore.instance.collection('user').doc(uid).set({
      'email': email,
      'gender': gender,
      'name': name,
      'password': password,
      'user-id': uid,
    });
  }
   static Future<bool> isEmailAlreadyAdded(String email) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('email', isEqualTo: email)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }
}
