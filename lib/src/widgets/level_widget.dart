import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_bubble_shooter_game/src/widgets/game_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';


import '../shooter.dart';
import '../config.dart';
import '../services/levelservice.dart';
import 'game_button.dart';
import 'game_scaffold.dart';




class LevelWidget extends StatelessWidget {
  final levelService = Get.find<LevelService>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > breakpointM;

    return Obx(() {
      final levels = Iterable.generate(levelService.totalLevels).map((level) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GameButton(
            text: "Level ${level + 1}",
            enabled: levelService.completedLevels.contains(level-1) || level == 0,
            onPressed: () {
              levelService.currentLevel = level;
              Get.to(GameApp());
            },
          ),
        );
      }).toList();


      // Responsive Layout Change: Levels Layout
      if (isWideScreen) {
        // For wide screens: wrap buttons in a row and let them scroll horizontally if overflow
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: levels,
          ),
        );

      } else {
        // For narrow screens: vertical column
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: levels,
        );
      }
    });
  }
}
