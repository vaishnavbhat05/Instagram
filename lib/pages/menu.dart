import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/view/LoginScreen.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false); // Log the user out
    prefs.remove('userId');
    print("Navigating to /login");
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: const Icon(Icons.arrow_back))
        // ],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout), // Logout icon
            onPressed: _logout, // Call logout method when clicked
          ),

        ]
      ),
    );
  }
}
