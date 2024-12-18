import 'package:flutter/material.dart';
import '../../utils/bubble_stories.dart';
import '../../utils/user_posts.dart';
import '../search.dart';
import '../add.dart';
import '../reels.dart';
import '../profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home},
    {'icon': Icons.search},
    {'icon': Icons.add_circle},
    {'icon': Icons.video_call},
    {
      'icon': const CircleAvatar(
        radius: 17,
        backgroundImage: NetworkImage(
          'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
        ),
      ),
    },
  ];

  final List people = [
    'Vaishnav',
    'Vikas',
    'Bhuvan',
    'Kavita',
    'Padma',
    'Chandan',
    'Pavan',
    'Shiva',
    'Shaham',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getSelectedPage() {
    switch (_selectedIndex) {
      case 0:
      // Home Page with Stories and Posts
        return Column(
          children: [
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return BubbleStories(text: people[index]);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return UserPosts(name: people[index]);
                },
              ),
            ),
          ],
        );
      case 1:
        return const UserSearch(); // Search Page
      case 2:
        return const UserAdd(); // Add New Post/Page
      case 3:
        return UserReels(); // Reels Page
      case 4:
        return const UserProfile(); // Profile Page
      default:
        return const Center(child: Text('Page not found'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Instagram",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_sharp, color: Colors.black),
              ),
              const Positioned(
                left: 28,
                top: 13,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined, color: Colors.black),
          ),
        ],
      )
          : null,
      body: _getSelectedPage(), // Render the appropriate page based on selected index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false, // Hide selected labels
        showUnselectedLabels: false, // Hide unselected labels
        items: List.generate(_navItems.length, (index) {
          final item = _navItems[index];
          return BottomNavigationBarItem(
            icon: item['icon'] is Widget
                ? item['icon'] as Widget // Custom widget for profile icon
                : Icon(
              item['icon'] as IconData,
              color: Colors.black,
            ),
            label: '', // No label
          );
        }),
      ),
    );
  }
}
