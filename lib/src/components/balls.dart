import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../shooter.dart';
import '../config.dart';
import 'ball.dart';
import 'bat.dart';

class Balls extends CircleComponent // extends Rectangle and uses collision detection
    with CollisionCallbacks, HasGameReference<Shooter> {
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
  void onCollisionStart( // defines logic for collision when ball hits the brick
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Ball && other.paint.color == paint.color) {
    removeFromParent(); // brick will be removed
    game.score.value++; // increase score when brick brocken
    }

    // win the game:
    if (game.world.children.query<Balls>().length == 1) { // defines to remove all bricks when there is only one brick left
      game.playState = PlayState.won;  // sets game state to won when bricks removed
      game.world.removeAll(game.world.children.query<Ball>()); // removes ball
      game.world.removeAll(game.world.children.query<Bat>()); // removes bat
    }
  }
}
