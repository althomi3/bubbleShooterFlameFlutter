import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'dart:math' as math;
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flame_bubble_shooter_game/src/services/gameservices.dart';
import 'package:get/get.dart';



import 'components/components.dart';
import 'config.dart';
import 'services/levelservice.dart';


// defines our game by extending FlameGame
// adds mixins to work with collision detection and get keyboard interaction, e.g., to move bat
class Shooter extends FlameGame with HasCollisionDetection, KeyboardEvents, TapDetector {
  Shooter()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth, // defined in config file
            height: gameHeight, // defined in config file
          ),
        );
  
  final gameService = Get.find<Gameservices>(); // instantiates gameservice to use global game vars for game configuration
  final levelService = Get.find<LevelService>(); // instantiates levelservice to use levels for game configuration
  final rand = math.Random();  
  double get width => size.x;
  double get height => size.y;



  

  // defines what to show on game start
  void startGame() {

    world.removeAll(world.children.query<Ball>());
    world.removeAll(world.children.query<Bat>());
    world.removeAll(world.children.query<Balls>());

    gameService.score.value = 0; // sets score to 0
    var currentLevel = levelService.currentLevel;

    // adds play ball
    world.add(Ball(                // instantiates the ball we created in ball.dart and adds values for props that were defined in constructor                              
          difficultyModifier: difficultyModifier,
          radius: ballsRadius,
          position: size / 3, // centers the ball's position
          velocity: Vector2((rand.nextDouble()) * width, height) // sets a random velocity for x and defines velocity for y
              .normalized() // normalized vector and keeps speed consistent
            ..scale(height / 2.5))); // scales up velocity to be 1/4th of screen height

    world.add(Bat(                                              
        size: Vector2(batWidth, batHeight),
        cornerRadius: const Radius.circular(ballRadius / 2),
        position: Vector2(width / 2, height * 0.95)));
    
    // adds bricks to the world
    world.addAll([      
      if (currentLevel == 0)
      for (var i = 0; i < colNr; i++) // creates as many bricks in the row as there are colors
        for (var j = 1; j <= levelService.levelIntensities[0]; j++) // creates 5 rows*/

         //for (var i = 0; i < 1; i++) // creates as many bricks in the row as there are colors
        //for (var j = 1; j <= 1; j++) // creates 5 rows
      
          Balls(
            position: Vector2( // testing: 300,500 // positions bricks
                          
              (i+ballRadius) + xOffset + (i * ballSpacing) + (j.isOdd ? ballSpacing / 2 : 0.0),
              (j + 2.0) * ballHeight + j * ballsGutter,
            ),
            color: ballsColors[rand.nextInt(ballsColors.length)],
          ),

      
      
      if (currentLevel == 1)
      for (var i = 0; i < colNr; i++) // creates as many bricks in the row as there are colors
        for (var j = 1; j <= levelService.levelIntensities[1]; j++) // creates 5 rows
          Balls(
            position: Vector2( // positions bricks
              //(i + 0.5) * ballRadius + (i + 1) * ballsGutter + (j.isOdd ? ballWidth / 2 : 0.0),
              //(i * (ballsRadius * 2 + ballsGutter)) + ballsGutter + (j.isOdd ? ballsRadius : 0.0),              
              (i+ballRadius) + xOffset + (i * ballSpacing) + (j.isOdd ? ballSpacing / 2 : 0.0),
              (j + 2.0) * ballHeight + j * ballsGutter,
            ),
            color: ballsColors[rand.nextInt(ballsColors.length)],
          ),

        if (currentLevel == 2)
        for (var i = 0; i < colNr; i++) // creates as many bricks in the row as there are colors
        for (var j = 1; j <= levelService.levelIntensities[2]; j++) // creates 5 rows
          Balls(
            position: Vector2( // positions bricks
              //(i + 0.5) * ballRadius + (i + 1) * ballsGutter + (j.isOdd ? ballWidth / 2 : 0.0),
              //(i * (ballsRadius * 2 + ballsGutter)) + ballsGutter + (j.isOdd ? ballsRadius : 0.0),              
              (i+ballRadius) + xOffset + (i * ballSpacing) + (j.isOdd ? ballSpacing / 2 : 0.0),
              (j + 2.0) * ballHeight + j * ballsGutter,
            ),
            color: ballsColors[rand.nextInt(ballsColors.length)],
          ),
    ]);    

    // debugMode = true; enable if you want to see debug annotations in game, e.g., dimensions of components

  }

  // defines what happens on tap = starts game
  /*@override                                                     
  void onTap() {
    super.onTap();–
    startGame();
  }  */  

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    //final backgroundImage = await images.load('galaxy_bg.jpg');


    camera.viewfinder.anchor = Anchor.topLeft; // anchors viewfinder to top left

    await world.add(PlayArea()); // ads play area which defines the game dimensions


    startGame(); // starts game on loading of game screen

  }

  @override // defines functionality for key interaction                                                   
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);
    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowLeft:
        world.children.query<Bat>().first.moveBy(-batStep); // uses bat step which is defined as a const in config.dart
      case LogicalKeyboardKey.arrowRight:
        world.children.query<Bat>().first.moveBy(batStep);

      // on space or enter, the game is started
      case LogicalKeyboardKey.space:                            
      case LogicalKeyboardKey.enter:
        startGame(); 
    }
    return KeyEventResult.handled;
  }    
  
}
