import 'package:flutter/material.dart';
import '../utils/bubble_stories.dart';
import '../utils/user_posts.dart';

class UserHome extends StatelessWidget {
  UserHome({super.key});

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Instagram",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_sharp)),
              const Positioned(
                  left: 28,
                  top: 13,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  ))
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.message_outlined))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 130,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return BubbleStories(text: people[index]);
                }),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) {
                return UserPosts(
                  name: people[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
