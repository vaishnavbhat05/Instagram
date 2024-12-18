import 'package:flutter/material.dart';
import 'package:instagram/pages/home/home_screen.dart';
import 'package:instagram/register/provider/RegisterProvider.dart';
import 'package:instagram/register/view/RegisterScreen.dart';
import 'package:provider/provider.dart';
import 'SplashScreen.dart';
import 'pages/home/provider/HomeProvider.dart';
import 'login/view/LoginScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/register': (context) => const RegisterScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
