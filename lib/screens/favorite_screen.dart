import 'package:flutter/material.dart';

// import '../widgets/bottom_navbar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Favorite"),
      ),

      // bottomNavigationBar:
      //     const BottomNavbar(
      //   currentIndex: 1,
      // ),
    );
  }
}