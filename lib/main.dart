import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mooc/controllers/authController.dart';
import 'package:mooc/views/introduction/introductionView.dart';
import 'package:mooc/views/landing/landingView.dart';
import 'views/signIn/signInView.dart';

void main() {
  Get.put(AuthController());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
  runApp(GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LandingView(),
    );
  }
}
