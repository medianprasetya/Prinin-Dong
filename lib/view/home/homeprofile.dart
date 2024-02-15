import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProfile extends StatefulWidget {
  const HomeProfile({super.key});
  static const routeName = '/homeprofile';

  @override
  State<HomeProfile> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  String name = "EKO PASS";
  dynamic saldo = "Rp. 60.000";
  String url = "https://picsum.photos/200/200";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          HeaderWidget(saldo: saldo, name: name),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.saldo,
    required this.name,
  });

  // ignore: prefer_typing_uninitialized_variables
  final String saldo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 79, 66),
            Color.fromARGB(255, 255, 161, 161),
            Color.fromARGB(255, 255, 181, 161),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 0, 0, 0),
            spreadRadius: 1,
            blurRadius: 20,
            offset: Offset(0, 15),
          ),
        ],
      ),
      child: DetailWidget(saldo: saldo, name: name),
    );
  }
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key,
    required this.saldo,
    required this.name,
  });

  final String saldo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(30),
      leading: const CircleAvatar(
        radius: 50,
        backgroundImage:
            NetworkImage("https://picsum.photos/200", scale: Checkbox.width),
      ),
      title: SizedBox(
        child: Text(
          'Saldo : $saldo',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width > 200 ? 18 : 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Text(
        name,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width > 200 ? 18 : 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
