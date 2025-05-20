import 'package:flutter_flame_bubble_shooter_game/src/services/gameservices.dart';
import 'package:flutter_flame_bubble_shooter_game/src/widgets/game_screen.dart';
import 'package:flutter_flame_bubble_shooter_game/src/widgets/level_widget.dart';
import 'package:flutter_flame_bubble_shooter_game/src/widgets/score_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config.dart';
import 'package:flutter/material.dart';
import 'game_button.dart';
import 'game_scaffold.dart';
import 'level_screen.dart';
import 'package:get/get.dart';




class ResultScreen extends StatelessWidget {
  final gameService = Get.find<Gameservices>(); // instantiates levelservice to use levels for game configuration


  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      content: [
            Center(
              child: Text("GAME OVER", textAlign: TextAlign.center, style:  GoogleFonts.honk(fontSize: 84),),
            ),
            Padding(padding: EdgeInsets.only(bottom: 24)),
            ScoreCard(score: gameService.score, textsize: 64,),
            Padding(padding: EdgeInsets.only(bottom: 48)),
            GameButton(text: "TRY AGAIN", enabled: true, onPressed: () => Get.to(() => LevelScreen()),)
      ],
    );
  }
}