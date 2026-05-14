import 'package:flutter/material.dart';

class BottomNavbar
    extends StatelessWidget {

  final int currentIndex;

  final Function(int)? onTap;

  const BottomNavbar({
    super.key,

    required this.currentIndex,

    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(

      currentIndex:
          currentIndex,

      onTap: onTap,

      type:
          BottomNavigationBarType.fixed,

      selectedItemColor:
          const Color(0xFF0066B3),

      unselectedItemColor:
          Colors.grey,

      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),

        BottomNavigationBarItem(
          icon:
              Icon(Icons.favorite_border),
          label: "Favorite",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "History",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Account",
        ),
      ],
    );
  }
}