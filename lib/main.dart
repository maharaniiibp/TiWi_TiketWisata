import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const TiWiApp());
}

class TiWiApp extends StatelessWidget {
  const TiWiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}