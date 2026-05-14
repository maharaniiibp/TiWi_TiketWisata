import 'package:flutter/material.dart';

import '../widgets/custom_header.dart';
import '../widgets/bottom_navbar.dart';

import 'home_screen.dart';
import 'favorite_screen.dart';
import 'history_screen.dart';
import 'profile_screen.dart';

class MainNavigationScreen
    extends StatefulWidget {

  const MainNavigationScreen({
    super.key,
  });

  @override
  State<MainNavigationScreen>
      createState() =>
          _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {

  int currentIndex = 0;

  final List<Widget> pages = [

    const HomeScreen(),

    const FavoriteScreen(),

    const HistoryScreen(),

    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF5F5F5),

      body: SafeArea(

        child: Column(
          children: [

            // HEADER
            const Padding(
              padding: EdgeInsets.all(20),

              child: CustomHeader(),
            ),

            // BODY
            Expanded(
              child:
                  pages[currentIndex],
            ),
          ],
        ),
      ),

      // NAVBAR
      bottomNavigationBar:
          BottomNavbar(

        currentIndex:
            currentIndex,

        onTap: (index) {

          setState(() {

            currentIndex = index;
          });
        },
      ),
    );
  }
}