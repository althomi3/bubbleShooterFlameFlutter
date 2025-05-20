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
  final gameService =
      Get.find<
        Gameservices
      >(); // instantiates levelservice to use levels for game configuration

  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      content: [
        Padding(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "GAME OVER",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.honk(fontSize: 84),
                ),
              ),
              SizedBox(height: 24,),
              ScoreCard(score: gameService.score, textsize: fontB),
              SizedBox(height: 24,),

              GameButton(
                text: "TRY AGAIN",
                enabled: true,
                onPressed: () => Get.to(() => LevelScreen()),
              ),
              //SizedBox(height: 120,),

            ],
          ),
        ),
      ],
    );
  }
}
