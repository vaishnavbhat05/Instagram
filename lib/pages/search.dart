import 'package:flutter/material.dart';

import '../utils/explore_grid.dart';

class UserSearch extends StatelessWidget {
  const UserSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey[400],
            child: Row(
              children: [
                const Icon(Icons.search),
                Text('search',style: TextStyle(color: Colors.grey[500]),)
              ],
            ),
          ),
        ),
      ),
      body: const ExploreGrid(),
    );
  }
}
