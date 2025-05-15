import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flame/game.dart';


class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: BubbleGame(),
    );
  }
}

class BubbleGame extends FlameGame{
  @override
  Widget build(BuildContext context) {
    return Text("test");
    /*var score = 0;
    var gameFinished = false;




    BubbleGame() {
    
    };*/
  }
}