import 'package:flutter/material.dart';
import 'package:instagram/pages/followers.dart';
import 'package:provider/provider.dart';
import '../pages/home/provider/HomeProvider.dart';
import '../../login/view/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FollowingsScreen extends StatefulWidget {
  const FollowingsScreen({super.key});

  @override
  _FollowingsScreenState createState() => _FollowingsScreenState();
}

class _FollowingsScreenState extends State<FollowingsScreen> {
  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false); // Log the user out
    prefs.remove('userId');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Followings"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body:
      const Center(child: Text("User's Followings List")),
    );
  }
}
