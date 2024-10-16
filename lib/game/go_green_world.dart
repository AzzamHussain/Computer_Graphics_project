import 'dart:async';

import 'package:flame/components.dart';
import 'package:recyclegame/constant.dart';

import 'package:recyclegame/game/go_green_game.dart';
import 'package:recyclegame/game/level_data.dart';
import 'package:recyclegame/game/sprites/bin.dart';
import 'package:recyclegame/game/sprites/obstacle.dart';
import 'package:recyclegame/game/sprites/player.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  late final Player player;

  void loadLevel(List<ObstacleData> levelData) {
    // remove any existing Obstacles
    removeAll(children.whereType<Obstacle>().toList());

    // load new obstacles from level data
    for (var data in levelData) {
      Obstacle obstacle;
      if (data.type == ObstacleType.trash) {
        obstacle = ObstacleTrash()..position = data.position;
      } else if (data.type == ObstacleType.water) {
        obstacle = ObstacleWater()..position = data.position;
      } else if (data.type == ObstacleType.fire) {
        obstacle = ObstacleFire()..position = data.position;
      } else if (data.type == ObstacleType.binTrash) {
        obstacle = BinTrash()..position = data.position;
      } else if (data.type == ObstacleType.binRecycle) {
        obstacle = BinRecycle()..position = data.position;
      } else {
        continue;
      }
      add(obstacle);
    }
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    player = Player();

    add(player);

    loadLevel(LevelData().getLevel(5));
  }

  @override
  void update(double dt) {
    super.update(dt);

    children.whereType<Obstacle>().forEach((obstacle) {
      obstacle.position.y -= (dt * 400);

      if (obstacle.position.y < -(gameRef.size.y / 2)) {
        obstacle.position.y = extendedHeight;
      }
    });
  }
}