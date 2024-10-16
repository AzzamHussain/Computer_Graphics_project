import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:recyclegame/constant.dart';
import 'package:recyclegame/game/go_green_world.dart';
import 'package:recyclegame/game_end_state.dart';

class GoGreenGame extends FlameGame<GoGreenWorld>
    with HorizontalDragDetector, HasCollisionDetection {
  GoGreenGame({
    required this.endCallback,
  }) : super(
          world: GoGreenWorld(),
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  final void Function(GameEndState endState) endCallback;

  @override
  Color backgroundColor() {
    return Colors.white;
  }

  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    super.onHorizontalDragUpdate(info);
    world.player.move(info.delta.global.x);
  }
}
