import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:recyclegame/splash.dart'; // Import your splash screen

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recycle Game',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),  // Start with the splash screen
    );
  }
}
