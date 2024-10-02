import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/AppButton.dart';
import 'package:news_app/components/CountryChooserWidget.dart';
import 'package:news_app/data/models/articles/Articles.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:news_app/ui/mainHome/bookmarks/BookmarkScreen.dart';
import 'package:news_app/ui/mainHome/home/details/ArticleDetailsScreen.dart';

import 'explore/ExploreScreen.dart';
import 'home/master/homeScreen.dart';
import 'profile/SettingsScreen.dart';

class Mainhome extends ConsumerStatefulWidget {
  Mainhome(this.valueChanged, {super.key});

  static const MainHomeTag = '/mainHome';
  final ValueChanged<ArticleItem> valueChanged;

  @override
  _MainhomeState createState() => _MainhomeState();
}

class _MainhomeState extends ConsumerState<Mainhome> {
  int _currentIndex = 0;
  final List<Widget> _screens = [];

  @override
  void initState() {
    _screens.addAll([
      Homescreen((article) {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext contex) {
              return ArticleDetailsScreen(articleItem: article);
            });
      }),
      const Bookmarkscreen(),
      const SettingsScreen(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: IndexedStack(
                index: _currentIndex,
                children: _screens,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
