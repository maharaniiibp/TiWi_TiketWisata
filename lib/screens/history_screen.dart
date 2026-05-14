import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("History"),
      ),

      bottomNavigationBar:
          const BottomNavbar(
        currentIndex: 2,
      ),
    );
  }
}