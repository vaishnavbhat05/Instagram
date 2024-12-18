import 'package:flutter/material.dart';

class UserReels extends StatelessWidget {
  UserReels({super.key});

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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Reels")),
    );
  }
}
