import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/history_screen.dart';
import '../screens/profile_screen.dart';

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

      type: BottomNavigationBarType.fixed,

      selectedItemColor:
          const Color(0xFF0066B3),

      unselectedItemColor:
          Colors.grey,

      onTap: (index) {

        if (index == currentIndex) return;

        Widget nextScreen;

        switch (index) {

          case 0:
            nextScreen = const HomeScreen();
            break;

          case 1:
            nextScreen =
                const FavoriteScreen();
            break;

          case 2:
            nextScreen =
                const HistoryScreen();
            break;

          case 3:
            nextScreen =
                const ProfileScreen();
            break;

          default:
            nextScreen = const HomeScreen();
        }

        Navigator.pushReplacement(
          context,

          MaterialPageRoute(
            builder: (context) => nextScreen,
          ),
        );
      },

      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "Home",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          activeIcon: Icon(Icons.favorite),
          label: "Favorite",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "History",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: "Account",
        ),
      ],
    );
  }
}