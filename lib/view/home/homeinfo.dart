// lib/home/HomeInfo.dart

import 'dart:math';

import 'package:flutter/material.dart';

class HomeInfo extends StatelessWidget {
  HomeInfo({super.key});
  static const routeName = '/homeinfo';
  final String title = "Title Page";
  final List<Container> containerDummy = List.generate(
    10,
    (index) {
      return Container(
        width: 200,
        height: 300,
        color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
            Random().nextInt(255)),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          backgroundColor: Colors.red,
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10 / 2,
              childAspectRatio: 1 / 2),
          children: containerDummy,
        ));
  }
}
