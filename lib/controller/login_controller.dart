import 'package:dataspot_machine_test/common_widgets/helper/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void login(BuildContext context) async {
    isLoading = true;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usernameController.text.trim(),
              password: passwordController.text.trim());

      if (userCredential.user != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, '/splash', (route) => false);
      }
      isLoading = false;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      if (e.code == 'user-not-found') {
        toast('No user Found with this Email');
      } else if (e.code == 'wrong-password') {
        toast('Password did not match');
      } else if (e.code == 'invalid-email') {
        toast('Email did not match');
      } else if (e.code == 'invalid-credential') {
        toast('Password did not match');
      }
    }
  }
}
