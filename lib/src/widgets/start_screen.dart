import 'package:flutter_flame_bubble_shooter_game/src/widgets/game_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../stylesheet.dart';
import 'package:flutter/material.dart';




class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,


          children: [
            Center(
              child: Text("The Ultimate Remake", textAlign: TextAlign.center, style:  GoogleFonts.honk(fontSize: 48),),
            ),
            Padding(
              padding: EdgeInsets.all(16),
            ),
            Center(
              child: Text("BUBBLE SHOOTER GAME", textAlign: TextAlign.center, style:  GoogleFonts.honk(fontSize: 84),),
            ),
            Padding(
              padding: EdgeInsets.all(32),
            ),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: purple_a, // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              padding: EdgeInsets.symmetric(horizontal: 64, vertical: 24), // Optional: Bigger button
            ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 8), // Space between icon and text
                  Text(
                    "START",
                    style: GoogleFonts.orbitron(fontSize: 24, fontWeight: FontWeight.bold , color: yellow_a)
                    ),
                  Icon(Icons.play_arrow, size: 28, color: yellow_a), // Your icon
                ],
              ),
              
              onPressed: () => Get.to(() => GameScreen()),
            ),


          ],
        ),
      ),
    );
  }
}