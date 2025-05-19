import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';
import 'package:flame/effects.dart';
import 'bat.dart';
import 'balls.dart'; // imported to use difficultyModifier
import '../config.dart';
import 'dart:math' as math;

import '../shooter.dart';                                 
import 'play_area.dart';

// defines play ball
class Ball extends CircleComponent with CollisionCallbacks, HasGameReference<Shooter> { // mixins for collision detection
static final _rand = math.Random();
static Color get randomColor => ballsColors[_rand.nextInt(ballsColors.length)]; 

  Ball({
    required this.velocity,
    required super.position,
    required double radius,
    required this.difficultyModifier,
    //required Color color,
  }) : super(
            radius: radius,
            anchor: Anchor.center,
            paint: Paint()
              ..color = Ball.randomColor
              ..style = PaintingStyle.fill,
              children: [CircleHitbox()],
              );
            
  final Vector2 velocity;
  final double difficultyModifier; 

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt; // defines velocity and position through velocity
  }

  // adds callback for collision detection. callback called in brick_breaker
  @override                                                     
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other); // intersectionPoints = position where two objects collide
    if (other is PlayArea) { // checks if object collides with something else than PlayArea, e.g., Bricks
      
      // collision with game fence
      if (intersectionPoints.first.y <= 0) { // checks if there is a collision on the y axis and then adjusts velocity to opposite direction
        velocity.y = -velocity.y;
      } else if (intersectionPoints.first.x <= 0) {
        velocity.x = -velocity.x;
      } else if (intersectionPoints.first.x >= game.width) {
        velocity.x = -velocity.x;
      } else if (intersectionPoints.first.y >= game.height) {
        add(RemoveEffect( // removes ball from game world                                      
          delay: 0.35,
          onComplete: () {                                    
              game.playState = PlayState.gameOver; // set gamestate to gameOver when ball removed
          }
        ));
      }

      // collision with bat
    } else if (other is Bat) { // if ball collides with bat, then the velocity and position are adjusted
      velocity.y = -velocity.y; // y velocity is reversed to that ball is kicked up
      velocity.x = velocity.x + // x velocity is adjusted so that ball gets a new angle
          (position.x - other.position.x) / other.size.x * game.width * 0.3;

    // collision with brick
    } else if (other is Balls) {     //                            
          if (position.y < other.position.y - other.size.y / 2) {
            velocity.y = -velocity.y;
          } else if (position.y > other.position.y + other.size.y / 2) {
            velocity.y = -velocity.y;
          } else if (position.x < other.position.x) {
            velocity.x = -velocity.x;
          } else if (position.x > other.position.x) {
            velocity.x = -velocity.x;
          }
          velocity.setFrom(velocity * difficultyModifier);  // with every brick, the vecolity is adjusted by multiplying with the difficultymodifier       
          paint.color = Ball.randomColor;
      }    
    }
}
