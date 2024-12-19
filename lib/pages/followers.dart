import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/provider/HomeProvider.dart';

class Followers extends StatelessWidget {
  const Followers({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Followers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
        centerTitle: true,

      ),
      body:
        const Center(child: Text("User's Followers List")),
    );
  }
}
