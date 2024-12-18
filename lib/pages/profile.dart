import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home/provider/HomeProvider.dart';
import '../utils/account_tab1.dart';
import '../utils/account_tab2.dart';
import '../utils/account_tab3.dart';
import '../utils/account_tab4.dart';
import '../utils/bubble_stories.dart';
import 'menu.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String selectedAccount = "vgb_05"; // Current account
  Future<void> _launchURL(
    String url,
  ) async {
    final Uri uri = Uri(host: 'www.youtube.com', scheme: 'https', path: url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showAddOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Center(
                  child: Text(
                "Create",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              ListTile(
                leading: const Icon(Icons.post_add),
                title: const Text('Add Post'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your post creation logic here
                },
              ),
              ListTile(
                leading: const Icon(Icons.history_edu),
                title: const Text('Add Story'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your story creation logic here
                },
              ),
              ListTile(
                leading: const Icon(Icons.movie),
                title: const Text('Add Reel'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your reel creation logic here
                },
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Add Story Highlight'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your story highlight logic here
                },
              ),
              ListTile(
                leading: const Icon(Icons.live_tv),
                title: const Text('Go Live'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your live streaming logic here
                },
              ),
              ListTile(
                leading: const Icon(Icons.auto_awesome),
                title: const Text('Made for You'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your "Made for You" feature logic here
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              selectedAccount,
              style: const TextStyle(fontSize: 18),
            ),
            actions: [
              // PopupMenuButton directly in the actions section
              PopupMenuButton<int>(
                icon: const Icon(Icons.arrow_drop_down),
                onSelected: (value) {
                  setState(() {
                    if (value == 1) {
                      selectedAccount = "vgb_05";
                    } else if (value == 2) {
                      selectedAccount = "admin_123";
                    } else if (value == 3) {
                      selectedAccount = "aj_453";
                    }
                  });
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text("vgb_05"),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text("admin_123"),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text("aj_453"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 190,
              ),
              IconButton(
                  onPressed: () {
                    _showAddOptions(context);
                  },
                  icon: const Icon(Icons.add)),
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Menu()));// Use Builder context
                    },
                    icon: const Icon(Icons.menu),
                  );
                },
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Info
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Column(
                            children: [
                              Text(
                                "237",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text('Posts'),
                            ],
                          ),
                          const Column(
                            children: [
                              Text(
                                "3930",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text('Followers'),
                            ],
                          ),
                          Column(
                            children: [
                              TextButton(
                                onPressed: (){
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Consumer<HomeProvider>(
                                          builder: (context, provider, child) {
                                            if (provider.allFollowers.isEmpty) {
                                              return const Center(child: Text("No followers available."));
                                            }

                                            return ListView.builder(
                                              itemCount: provider.allFollowers.length,
                                              itemBuilder: (context, index) {
                                                final follower = provider.allFollowers[index];
                                                return ListTile(
                                                  title: Text(follower['name']!),
                                                  leading: CircleAvatar(child: Text(follower['initials']!)),
                                                  trailing: IconButton(
                                                    icon: provider.followingList.contains(follower['name'])
                                                        ? const Icon(Icons.check)
                                                        : const Icon(Icons.add),
                                                    onPressed: () {
                                                      if (provider.followingList.contains(follower['name'])) {
                                                        provider.remove(
                                                            follower['name']!); // Remove from database and UI
                                                      } else {
                                                        provider.add(follower['name']!); // Add to database and UI
                                                      }
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                child: const Column(
                                  children: [
                                    Text(
                                      "40",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    Text('Followings'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Bio Section
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Vaishnav",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Text('I create apps & games'),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchURL('watch?v=668nUCeBHyY');
                      },
                      child: const Text(
                        'm.youtube/vaishnav/myfav',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
              // Buttons Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: Text("Edit Profile")),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: Text("Share Profile")),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: Text("My Story")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Stories Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    BubbleStories(text: 'story 1'),
                    BubbleStories(text: 'story 2'),
                    BubbleStories(text: 'story 3'),
                    BubbleStories(text: 'story 4'),
                    BubbleStories(text: 'story 5'),
                  ],
                ),
              ),
              // Tabs Section
              const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.grid_3x3_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.video_call),
                  ),
                  Tab(
                    icon: Icon(Icons.shop),
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                  ),
                ],
              ),
              // Tab Views
              const Expanded(
                child: TabBarView(
                  children: [
                    AccountTab1(),
                    AccountTab2(),
                    AccountTab3(),
                    AccountTab4(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
