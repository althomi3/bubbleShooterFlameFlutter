import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import '../shooter.dart';
import '../config.dart';


// defines the bat with which a user can bounce back the ball
class Bat extends PositionComponent // Bat introduced as position component which needs usage of "render" method below to render the rectangle
    with DragCallbacks, HasGameReference<Shooter> {
  Bat({
    required this.cornerRadius,
    required super.position,
    required super.size,
  }) : super(
          anchor: Anchor.center,
          children: [RectangleHitbox()], // hitbox for collision detection
        );

  final Radius cornerRadius;

  final _paint = Paint()
    ..color = white_a
    ..style = PaintingStyle.fill;

  @override
  void render(Canvas canvas) { // renders the bat
    super.render(canvas);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size.toSize(),
          cornerRadius,
        ),
        _paint);
  }

  /*@override // updates position on drag
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    position.x = (position.x + event.localDelta.x * 1.2).clamp(0, game.width);
  }*/

  // uses canvas position instead of delta to make it feelmore "sticking" to the finger
  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    // Make the bat center stick to the finger's x position
    position.x = event.canvasStartPosition.x.clamp(size.x / 2, game.width - size.x / 2);
  }

  void moveBy(double dx) { // allows movement of bat by key control
    add(MoveToEffect(
      Vector2((position.x + dx).clamp(0, game.width), position.y),
      EffectController(duration: 0.1),
    ));
  }
}
