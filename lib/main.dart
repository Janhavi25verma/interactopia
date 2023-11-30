import 'package:flutter/material.dart';
import 'package:interactopia/features/auth/screens/login_screen.dart';
import 'package:interactopia/theme/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interactopia',
      theme: Pallete.darkModeAppTheme,
      home: const LoginScreen(),
    );
  }
}
