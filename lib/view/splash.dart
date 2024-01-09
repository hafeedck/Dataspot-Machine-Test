import 'package:dataspot_machine_test/common_widgets/colors/colors.dart';
import 'package:dataspot_machine_test/common_widgets/text/text.dart';
import 'package:dataspot_machine_test/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      Provider.of<SplashState>(context, listen: false)
          .checkLoginStatus(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              commonText("DATA SPOT", fontSize: 35, color: primaryColor)
            ],
          ),
        ));
  }
}
