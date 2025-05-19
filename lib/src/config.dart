import 'package:flutter/material.dart';
import 'package:flutter_flame_bubble_shooter_game/src/components/play_area.dart'; 



// Game dimensions
const gameWidth = 820.0;
const gameHeight = 1600.0;
const ballRadius = gameWidth * 0.02;

// Bat dimensions
const batWidth = gameWidth * 0.2;                             
const batHeight = ballRadius * 2;
const batStep = gameWidth * 0.05;   // defines the steps a bat moves on user interaction

// Brick dimensions
const ballsGutter = gameWidth * 0.015;                          
final ballWidth =
    (gameWidth - (ballsGutter * (ballsColors.length + 1)))
    / ballsColors.length;
final ballsRadius = gameWidth * 0.04;
const ballHeight = gameHeight * 0.03;
const difficultyModifier = 1.03;  
//const colNr = 12;
//var colNr = (gameWidth / (ballsRadius * 2 + ballsGutter)).floor();

final ballSpacing = ballsRadius * 2; // + ballsGutter -- no ball gutters;
final colNr = ((gameWidth / ballSpacing).floor())-1; // how many balls fit
final totalWidth = colNr * ballSpacing - ballsGutter; // total width used by all balls
final xOffset = (gameWidth - totalWidth) / 2; // offset to center the row


const ballsColors = [                                           
  Color(0xfff94144),
  //Color(0xfff3722c),
  //Color(0xfff8961e),
  //Color(0xfff9844a),
  Color(0xfff9c74f),
  Color(0xff90be6d),
  Color(0xff43aa8b),
  //Color(0xff4d908e),
  Color(0xff277da1),
  //Color(0xff577590),
];

// fontcolors

var yellow_a =  Color.fromARGB(255, 252, 245, 23);


// fillcolors
var purple_a =  Color.fromARGB(255, 140, 0, 200);
var yellow_b =  Color.fromARGB(255, 252, 251, 229);






