import 'package:dataspot_machine_test/controller/home_controller.dart';
import 'package:dataspot_machine_test/controller/login_controller.dart';
import 'package:dataspot_machine_test/controller/registration_controller.dart';
import 'package:dataspot_machine_test/controller/splash_controller.dart';
import 'package:dataspot_machine_test/routes/page_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashState()),
        ChangeNotifierProvider(create: (_) => LoginState()),
        ChangeNotifierProvider(create: (_) => RegistrationState()),
        ChangeNotifierProvider(create: (_) => HomeState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        title: "Dataspot Machine Test",
        initialRoute: '/splash',
      ),
    );
  }
}
