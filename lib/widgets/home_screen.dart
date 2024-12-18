import 'package:flutter/material.dart';
import '../pages/add.dart';
import '../pages/home.dart';
import '../pages/profile.dart';
import '../pages/reels.dart';
import '../pages/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Keeps track of the selected tab index

  // Function to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.search, 'label': 'Search'},
    {'icon': Icons.add_circle, 'label': 'Add'},
    {'icon': Icons.video_call, 'label': 'Reels'},
    {
      'icon': const CircleAvatar(
        radius: 17,
        backgroundImage: NetworkImage(
          'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
        ),
      ),
      'label': 'Profile',
      'isCustom': true, // Indicate if this item uses a custom widget
    },
  ];
  final List<Widget> _children = [
    UserHome(),
    const UserSearch(),
    const UserAdd(),
    UserReels(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: List.generate(_navItems.length, (index) {
          final item = _navItems[index];
          return BottomNavigationBarItem(
            icon: item['isCustom'] == true
                    ? item['icon'] as Widget
                    : Icon(
                        item['icon'] as IconData,
                        color: Colors.black,
                      ),
            label: item['label'] as String,
          );
        }),
      ),
    );
  }
}
