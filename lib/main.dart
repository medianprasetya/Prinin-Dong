// lib/main.dart

import 'package:flutter/material.dart';
import 'package:prinin_dong/view/auth/loginpage.dart';

import 'view/home/homeinfo.dart';
import 'view/home/splashscreen.dart';
import 'view/home/homepage.dart';
import 'view/home/homeprofile.dart';

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
      home: const HomePage(),
      initialRoute: HomePage.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomePage.routeName: (context) => const HomePage(),
        HomeProfile.routeName: (context) => const HomeProfile(),
        HomeInfo.routeName: (context) => HomeInfo(),
        LoginPage.routeName: (context) => const LoginPage(),
      },
    );
  }
}
