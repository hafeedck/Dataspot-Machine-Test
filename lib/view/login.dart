import 'package:dataspot_machine_test/common_widgets/buttons/common_button.dart';
import 'package:dataspot_machine_test/common_widgets/colors/colors.dart';
import 'package:dataspot_machine_test/common_widgets/text/text.dart';
import 'package:dataspot_machine_test/common_widgets/textfield/textfield_with_text.dart';
import 'package:dataspot_machine_test/controller/login_controller.dart';
import 'package:dataspot_machine_test/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginState loginState = Provider.of<LoginState>(context);
    GlobalKey<FormState>? myFormKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 0,
        bottomOpacity: 0,
      ),
      body: Form(
        key: myFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                100.0.spaceY,
                Center(
                    child:
                        commonText("Login", fontSize: 30, color: Colors.black)),
                25.0.spaceY,
                TextfieldWithText(
                  hintText: "Enter username or email ID",
                  labelText: "Username/Email ID",
                  textEditingController: loginState.usernameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Username/Email ID';
                    }
                    return null;
                  },
                ),
                25.0.spaceY,
                TextfieldWithText(
                  hintText: "Enter password",
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  labelText: "Password",
                  textEditingController: loginState.passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Password';
                    }
                    return null;
                  },
                ),
                75.0.spaceY,
                CommonButtonWidget(
                  label: "Submit",
                  isLoading: loginState.isLoading,
                  onClick: () {
                    if (myFormKey.currentState!.validate()) {
                      loginState.login(context);
                    }
                  },
                  color: primaryColor,
                ),
                15.0.spaceY,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText("Not Registerd yet",
                        fontSize: 15, color: Colors.black),
                    5.0.spaceX,
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/registration',
                        );
                      },
                      child: commonText("Craete an account?",
                          fontSize: 15, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
