import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'favorite_screen.dart';
import 'history_screen.dart';
import 'profile_screen.dart';

import '../widgets/bottom_navbar.dart';
import '../widgets/custom_header.dart';

class MainNavigationScreen extends StatefulWidget {
  final int initialIndex;

  const MainNavigationScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {

  late int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      body: SafeArea(
        child: Column(
          children: [

            const Padding(
              padding: EdgeInsets.all(20),
              child: CustomHeader(),
            ),

            Expanded(
              child: _screens[_selectedIndex],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavbar(
        currentIndex: _selectedIndex,

        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}