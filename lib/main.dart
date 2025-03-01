import 'package:flutter/material.dart';
import 'package:petspaw_admin/features/login/login_screen.dart';
import 'package:petspaw_admin/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: LoginScreen(),
    );
  }
}
