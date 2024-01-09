import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashState extends ChangeNotifier {
  void checkLoginStatus(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }
}
