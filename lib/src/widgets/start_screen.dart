import 'package:flutter_flame_bubble_shooter_game/src/widgets/game_screen.dart';
import 'package:flutter_flame_bubble_shooter_game/src/widgets/level_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config.dart';
import 'package:flutter/material.dart';
import 'game_button.dart';
import 'game_scaffold.dart';
import 'level_screen.dart';



class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      content: [
            Center(
              child: Text("BRICK BREAKER", textAlign: TextAlign.center, style:  GoogleFonts.honk(fontSize: 84),),
            ),
            Padding(
              padding: EdgeInsets.all(8),
            ),
            Center(
              child: Text("meets", textAlign: TextAlign.center, style:  GoogleFonts.honk(fontSize: 84),),
            ),
            Padding(
              padding: EdgeInsets.all(8),
            ),
            
            Center(
              child: Text("BUBBLE SHOOTER", textAlign: TextAlign.center, style:  GoogleFonts.honk(fontSize: 84),),
            ),
            Padding(
              padding: EdgeInsets.all(32),
            ),
            Center(
              child: Text("SHOOT BUBBLES OF THE SAME COLOR TO BREAK FREE", textAlign: TextAlign.center, style:  GoogleFonts.orbitron(fontSize: 20, color: yellow_a, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(8),
            ),
            GameButton(text: "START", enabled: true, onPressed: () => Get.to(() => LevelScreen()),)
      ],
    );
  }
}