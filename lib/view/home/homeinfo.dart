// lib/home/HomeInfo.dart

import 'package:flutter/material.dart';

class HomeInfo extends StatelessWidget {
  static const routeName = '/homeinfo';

  const HomeInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Information'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
