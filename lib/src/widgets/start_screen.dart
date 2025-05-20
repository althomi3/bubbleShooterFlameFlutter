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
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: Column(
              children: [
                Expanded( flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                    children: [
                      SizedBox(height: 84),
                      Center(
                        child: Text(
                          "BRICK BREAKER",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.honk(fontSize: fontA),
                        ),
                      ),
                      Center(
                        child: Text(
                          "meets",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.honk(fontSize: fontA),
                        ),
                      ),
                      Center(
                        child: Text(
                          "BUBBLE SHOOTER",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.honk(fontSize: fontA),
                        ),
                        ),
                      Center(
                          child: Text (
                          "SHOOT YOUR WAY INTO THE GALAXY BY HITTING BUBBLES OF THE SAME COLOR",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.orbitron(
                            fontSize: 16,
                            color: yellow_a,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
                
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 64)),
                      GameButton(
                        text: "START",
                        enabled: true,
                        onPressed: () => Get.to(() => LevelScreen()),
                      ),
                    ],
                  ),
                  ),
                  
                  
                ),
                SizedBox(height: 48),

              ],
            ),
        ),
        
        
      ),
      
    );
  }
}
