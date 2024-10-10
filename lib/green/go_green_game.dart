import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:recyclegame/constant.dart';
import 'package:recyclegame/green/go_green_world.dart';

class GoGreenGame extends FlameGame {
  GoGreenGame()
      : super(
          world: GoGreenWorld(),
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  @override
  Color backgroundColor() {
    return Colors.green;
  }
}