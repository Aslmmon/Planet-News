import 'package:flutter/material.dart';
import 'package:news_app/components/AppButton.dart';
import 'package:news_app/ui/mainHome/bookmarks/BookmarkScreen.dart';

import 'explore/ExploreScreen.dart';
import 'home/homeScreen.dart';
import 'profile/SettingsScreen.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  static const MainHomeTag = '/mainHome';

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const Homescreen(),
    const Explorescreen(),
    const Bookmarkscreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        // Shifting
        selectedItemColor: AppBlueColor,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
      body: _screens[_currentIndex],
    );
  }
}
