import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_bubble_shooter_game/src/services/gameservices.dart';
import 'package:flutter_flame_bubble_shooter_game/src/services/levelservice.dart';

import '../shooter.dart';
import '../config.dart';
import 'ball.dart';
import 'bat.dart';
import 'package:get/get.dart';


class Balls extends CircleComponent // extends Rectangle and uses collision detection
    with CollisionCallbacks, HasGameReference<Shooter> {

  final gameService = Get.find<Gameservices>(); // instantiates levelservice to use levels for game configuration
  final levelService = Get.find<LevelService>(); // needed to update the set of successfully ended games

  Balls({required super.position, required Color color})
      : super(
          radius: ballsRadius,
          anchor: Anchor.center,
          paint: Paint()
            ..color = color
            ..style = PaintingStyle.fill,
          children: [CircleHitbox()],
        );

  @override
  Future<void> onCollisionStart( // defines logic for collision when ball hits the brick
      Set<Vector2> intersectionPoints, PositionComponent other) async {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Ball && other.paint.color == paint.color) {
    removeFromParent(); // brick will be removed
    gameService.score.value++; // increase score when brick brocken
    }

    // win the game:
    if (game.world.children.query<Balls>().length == 1) { // defines to remove all bricks when there is only one brick left
      await levelService.levelCompleted(levelService.currentLevel);
      //game.playState = PlayState.won;  // sets game state to won when bricks removed
      game.world.removeAll(game.world.children.query<Ball>()); // removes ball
      game.world.removeAll(game.world.children.query<Bat>()); // removes bat
    }
  }
}
