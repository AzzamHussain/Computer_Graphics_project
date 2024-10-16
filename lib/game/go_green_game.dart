import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:recyclegame/constant.dart';
import 'package:recyclegame/game/go_green_world.dart';

class GoGreenGame extends FlameGame<GoGreenWorld>
    with HorizontalDragDetector, TapDetector, HasCollisionDetection {
  GoGreenGame()
      : super(
          world: GoGreenWorld(),
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    debugMode = true;
  }

  @override
  Color backgroundColor() {
    return Colors.yellow;
  }

  // Handle horizontal drag to move player
  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    super.onHorizontalDragUpdate(info);
    world.player.move(info.delta.global.x);
  }

  // Handle tap to move left or right based on the tap position
  @override
  void onTapDown(TapDownInfo info) {
    final tapPosition = info.eventPosition.global;  //.game
    final playerPosition = world.player.position;

    // Move the player based on the tap position
    if (tapPosition.x < playerPosition.x) {
      // Tap on the left side of the player, move left
      world.player.move(-20); // Adjust speed as needed
    } else {
      // Tap on the right side of the player, move right
      world.player.move(20); // Adjust speed as needed
    }
  }
}
