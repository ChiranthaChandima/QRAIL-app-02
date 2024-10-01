import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qrail_fp/screens/auth_pages/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomScreen()),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
    body: Container(
      color: Colors.white,
      child: Stack(
        children: [
          Center( // This centers the SizedBox in the middle of the screen
            child: SizedBox(
              width: 200,
              child: Image.asset(
                'assets/images/qr-02.png',
                fit: BoxFit.cover, // Scales the image to cover the SizedBox
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
