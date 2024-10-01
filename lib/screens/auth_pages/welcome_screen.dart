// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qrail_fp/screens/auth_pages/login_screen.dart';
import 'package:qrail_fp/screens/auth_pages/sign_up.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Add image without CircleAvatar
              Image.asset(
                'assets/images/qr-02.png',
                width: 150, // Set the image width to 200
                height: 150, // Set the image height to match
              ),
              SizedBox(height: 50.0),
              Text(
                "Welcome to QRail",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "All Aboard Sign in to Explore Train Travel with QRail",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 80.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1c50d0), // Set the button color to blue
                  padding: EdgeInsets.symmetric(vertical: 17.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Border radius
                  ),
                  elevation: 8, // Add elevation for shadow
                  shadowColor: Colors.black
                      .withOpacity(1), // Set shadow color and opacity
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1c50d0), // Set the button color to blue
                  padding: EdgeInsets.symmetric(vertical: 17.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Border radius
                  ),elevation: 8, // Add elevation for shadow
                  shadowColor: Colors.black
                      .withOpacity(1), // Set shadow color and opacity
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
