import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {

  runApp(
    const TiWiApp(),
  );
}

class TiWiApp extends StatelessWidget {

  const TiWiApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner:
          false,

      title: 'TiWi',

      theme: ThemeData(

        useMaterial3: true,

        scaffoldBackgroundColor:
            const Color(0xFFF5F5F5),

        colorScheme: ColorScheme.fromSeed(
          seedColor:
              const Color(0xFF0066B3),
        ),
      ),

      home: const LoginScreen(),
    );
  }
}