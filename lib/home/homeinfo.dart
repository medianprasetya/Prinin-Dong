// lib/home/HomeInfo.dart

import 'package:flutter/material.dart';

class HomeInfo extends StatelessWidget {
  static const routeName = '/homeinfo';
  const HomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Information'),
          backgroundColor: Colors.red,
        ),
        body: Row(
          children: const [Text("ini information")],
        ),
      ),
    );
  }
}
