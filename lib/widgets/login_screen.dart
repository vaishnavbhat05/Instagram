import 'package:flutter/material.dart';
import 'package:instagram/widgets/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login")),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 300,),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: Container(
                    width: 40,
                    height: 40,
                    child: const Center(child: Text('Login')))),
          ),
        ],
      ),
    );
  }
}
