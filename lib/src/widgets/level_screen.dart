import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_bubble_shooter_game/src/widgets/game_screen.dart';
import 'package:flutter_flame_bubble_shooter_game/src/widgets/start_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';


import '../shooter.dart';
import '../config.dart';
import '../services/levelservice.dart';
import 'game_button.dart';
import 'game_scaffold.dart';
import 'level_widget.dart';
import 'inline_button.dart';




class LevelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return GameScaffold(
      content: [
        Text(
          "LEVELS",
          textAlign: TextAlign.center,
          style: GoogleFonts.honk(fontSize: 84),
        ),
        SizedBox(height: 24),
        LevelWidget(),
        Padding(padding: EdgeInsets.only(top: 8)),
        InlineButton(onPressed: () => Get.to(() => StartScreen()), buttonText: "Back to Start",)
        
      ],
    );
  }
}