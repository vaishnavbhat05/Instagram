import 'package:flutter/material.dart';

class UserAdd extends StatelessWidget {
  const UserAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AlertDialog(
        title: Text("choose one"),
        content: Text("add by camera"),

      )
    );
  }
}
