// lib/home/splashscreen.dart

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
// import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late bool isLoading;
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    isLoading = true;

    // Inisialisasi animasi rotasi
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _rotationAnimation =
        Tween(begin: 0.0, end: 360.0).animate(_rotationController);

    // Memeriksa koneksi jaringan
    _checkNetworkConnection();
  }

  Future<void> _checkNetworkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    // Jika terhubung ke jaringan, delay 2 detik dan tutup SplashScreen
    if (connectivityResult != ConnectivityResult.none) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });

        Navigator.of(context).pushReplacementNamed('/home');
      });
    } else {
      // Jika tidak terhubung, cek koneksi setiap detik
      _checkConnectionPeriodically();
    }
  }

  void _checkConnectionPeriodically() {
    Future.delayed(const Duration(seconds: 1), () {
      _checkNetworkConnection();
    });
  }

  @override
  void dispose() {
    // Hentikan animasi dan controller ketika widget dihapus
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 204, 204),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 80,
              child: Icon(
                Icons.print_rounded,
                size: 52,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            if (isLoading)
              _buildLoadingIndicator() // Tampilkan indikator loading
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return RotationTransition(
      turns: _rotationAnimation,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CircularProgressIndicator(),
          SizedBox(width: 0),
        ],
      ),
    );
  }
}
