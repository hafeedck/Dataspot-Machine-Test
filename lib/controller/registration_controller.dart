import 'package:dataspot_machine_test/common_widgets/helper/toast.dart';
import 'package:dataspot_machine_test/service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationState extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void signupUser(BuildContext context) async {
    isLoading = true;
    try {
      bool isEmailAlreadyAdded = await FirestoreServices.isEmailAlreadyAdded(
          emailController.text.trim());
      if (isEmailAlreadyAdded == false) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: userPasswordController.text.trim());
        if (userCredential.user != null) {
          await FirestoreServices.saveUser(
              emailController.text.trim(),
              genderController.text.trim(),
              nameController.text.trim(),
              userPasswordController.text.trim(),
              userCredential.user!.uid);
        }
        toast('Sucessfully Registerd');
        await FirebaseAuth.instance.signOut();
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
        clear();
      } else {
        toast('Email Already Registerd');
      }

      isLoading = false;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      if (e.code == 'weak-password') {
        debugPrint('Password Provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('Email Provided already Exists');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  clear() {
    emailController.clear();
    genderController.clear();
    nameController.clear();
    userPasswordController.clear();
  }
}
