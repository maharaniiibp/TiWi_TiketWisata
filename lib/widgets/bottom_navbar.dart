import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {

  final int currentIndex;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: currentIndex,

      selectedItemColor:
          const Color(0xFF0066B3),

      unselectedItemColor:
          Colors.grey,

      type: BottomNavigationBarType.fixed,

      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Favorite",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "History",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Akun",
        ),
      ],
    );
  }
}