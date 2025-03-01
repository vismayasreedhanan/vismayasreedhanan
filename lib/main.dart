import 'package:flutter/material.dart';
import 'package:petspaw_admin/features/login/login_screen.dart';
import 'package:petspaw_admin/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://wwzpopykadxqtisivayi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind3enBvcHlrYWR4cXRpc2l2YXlpIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczMjg1NzY0OSwiZXhwIjoyMDQ4NDMzNjQ5fQ.SSZ0oFewaR68x_XQQYoEHdIjDCqSdk6_7t0eecHZ9tg',
  );

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
