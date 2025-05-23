import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_bubble_shooter_game/src/services/gameservices.dart';
import 'package:flutter_flame_bubble_shooter_game/src/services/levelservice.dart';
import 'package:flutter_flame_bubble_shooter_game/src/widgets/level_screen.dart';

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

    // win the game

    final bool matched = other is Ball && other.paint.color == paint.color; // condition for removing a ball

    if (matched) {
      removeFromParent(); // Remove the brick
      gameService.score.value++; // Increase score
    }

    // Check for win only if this ball was removed
    if (matched && game.world.children.query<Balls>().length == 1) { // only if this was the last ball and teh colors matched
      await levelService.levelCompleted(levelService.currentLevel);

      // Clear game state
      game.world.removeAll(game.world.children.query<Ball>());
      game.world.removeAll(game.world.children.query<Bat>());

      Get.to(() => LevelScreen()); // user gets navigated to levels
    }
  }
}
