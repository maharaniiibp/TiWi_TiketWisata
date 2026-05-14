import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Account"),
      ),

      bottomNavigationBar:
          const BottomNavbar(
        currentIndex: 3,
      ),
    );
  }
}