// lib/main.dart

import 'package:flutter/material.dart';
import 'auth/loginpage.dart';
import 'home/homeinfo.dart';
import 'home/splashscreen.dart';
import 'home/homepage.dart';
import 'home/homeprofile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var faker = new Faker();
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      // home: const SplashScreen(),
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const HomeProfile(),
        '/info': (context) => const HomeInfo(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
