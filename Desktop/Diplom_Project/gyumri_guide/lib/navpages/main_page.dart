import 'package:flutter/material.dart';
import 'package:gyumri_guide/db/preference_service.dart';
import 'package:gyumri_guide/navpages/chat_page.dart';
import 'package:gyumri_guide/navpages/favorites_page.dart';
import 'package:gyumri_guide/navpages/map_page.dart';
import 'package:gyumri_guide/pages/home_page_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.preferenceService});

  final PreferenceService? preferenceService;

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    const HomePage(),
    const MapPage(),
    const ChatPage(),
    const FavoritePage(),
  ];

  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        onTap: _onTap,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blue,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
