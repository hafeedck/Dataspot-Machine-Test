import 'package:dataspot_machine_test/view/home.dart';
import 'package:dataspot_machine_test/view/login.dart';
import 'package:dataspot_machine_test/view/registration.dart';
import 'package:dataspot_machine_test/view/splash.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/splash': (context) => const SplashView(),
  '/login': (context) => const LoginView(),
  '/registration': (context) => const RegistrationView(),
  '/home': (context) => const HomeView(),
};
