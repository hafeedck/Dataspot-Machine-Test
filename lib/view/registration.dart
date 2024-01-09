import 'package:dataspot_machine_test/common_widgets/appbar/common_appbar.dart';
import 'package:dataspot_machine_test/common_widgets/buttons/common_button.dart';
import 'package:dataspot_machine_test/common_widgets/colors/colors.dart';
import 'package:dataspot_machine_test/common_widgets/text/text.dart';
import 'package:dataspot_machine_test/common_widgets/textfield/textfield_with_text.dart';
import 'package:dataspot_machine_test/controller/registration_controller.dart';
import 'package:dataspot_machine_test/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final RegistrationState regState = Provider.of<RegistrationState>(context);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: regState.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: commonText("Registration Form",
                          fontSize: 25, color: Colors.black)),
                  15.0.spaceY,
                  TextfieldWithText(
                    hintText: "Name",
                    labelText: "Name",
                    textEditingController: regState.nameController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter name';
                      }
                      return null;
                    },
                  ),
                  25.0.spaceY,
                  TextfieldWithText(
                    hintText: "Email",
                    labelText: "Email",
                    textEditingController: regState.emailController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Email';
                      } else if (!RegExp(
                              "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                          .hasMatch(value)) {
                        return 'Please Enter a valid Email';
                      }
                      return null;
                    },
                  ),
                  25.0.spaceY,
                  TextfieldWithText(
                    hintText: "Gender",
                    labelText: "Gender",
                    textEditingController: regState.genderController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter gender';
                      }
                      return null;
                    },
                  ),
                  25.0.spaceY,
                  TextfieldWithText(
                    hintText: "Password",
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    labelText: "Password",
                    textEditingController: regState.userPasswordController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Password';
                      } else if (value.toString().length <= 8) {
                        return 'Weak Password';
                      }
                      return null;
                    },
                  ),
                  30.0.spaceY,
                  CommonButtonWidget(
                    label: "Next",
                    isLoading: regState.isLoading,
                    onClick: () {
                      if (regState.formKey.currentState!.validate()) {
                        regState.isLoading == !regState.isLoading;
                        regState.signupUser(context);
                      }
                    },
                    color: primaryColor,
                  ),
                  15.0.spaceY,
                  Center(
                    child: InkWell(
                      onTap: () {
                        regState.clear();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (route) => false);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue.withOpacity(0.1),
                        ),
                        height: size.height * 0.07,
                        width: size.width * 0.95,
                        child: Center(
                          child: commonText("Back To Login Form",
                              fontSize: 15, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
