import 'package:blood_app/controller/auth_controller.dart';
import 'package:blood_app/views/home_screen.dart';
import 'package:blood_app/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blood App',
      theme: ThemeData(),
      builder: ((context, child) {
        AuthController controller = Get.put(AuthController());
        if (controller.isLoggedIn.value) {
          return const HomeScreen();
        }
        return child!;
      }),
      home: const LoginScreen(),
    );
  }
}
