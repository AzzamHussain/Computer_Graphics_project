import 'package:flutter/material.dart';
import 'dart:async';
import 'package:recyclegame/app.dart'; // Import your GameApp

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to GameApp after 5 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const GameApp()), // Transition to GameApp
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/splashRe.png', // Path to splash image
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
