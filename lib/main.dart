import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import 'package:recyclegame/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();

  runApp(const GameApp());
}