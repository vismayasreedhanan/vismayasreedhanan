import 'package:flutter/material.dart';
import 'package:petspaw_admin/features/login_screen.dart';
import 'package:petspaw_admin/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your
  // application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: LoginScreen(),
    );
  }
}
