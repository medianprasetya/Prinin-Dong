// lib/main.dart

import 'package:flutter/material.dart';
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
    return MaterialApp(
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomePage(),
        '/profile': (context) => const HomeProfile(),
      },
    );
  }
}
