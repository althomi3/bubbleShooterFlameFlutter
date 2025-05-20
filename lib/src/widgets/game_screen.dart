import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_bubble_shooter_game/src/services/gameservices.dart';
import 'package:flutter_flame_bubble_shooter_game/src/services/levelservice.dart';
import 'package:flutter_flame_bubble_shooter_game/src/widgets/inline_button.dart';
import 'package:flutter_flame_bubble_shooter_game/src/widgets/result_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../shooter.dart';
import '../config.dart';
import 'game_scaffold.dart';

import 'score_card.dart';

// -- GAME-- 

class GameApp extends StatefulWidget {
  const GameApp({super.key});


 @override                                                     
  State<GameApp> createState() => GameAppState();
}

class GameAppState extends State<GameApp> {
  late final Shooter game;


  @override
  void initState() {
    super.initState();
    game = Shooter();
  }  


  @override
  Widget build(BuildContext context) {
  final gameService = Get.find<Gameservices>(); // instantiates levelservice to use levels for game configuration
  //final levelService = Get.find<LevelService>(); // instantiates levelservice to use levels for game configuration


    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // THEME
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.orbitronTextTheme().apply(
          bodyColor: white_a,
          //displayColor: const Color(0xff184e77),
        ),
      ),

      // BACKGROUND
      home: GameScaffold(
        body: //GAME CONTENT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(                                  
                  children: [

                    // SCORECARD
                    ScoreCard(score: gameService.score, textsize: 32,),

                    // Button for testing
                    /*ElevatedButton(
                      onPressed: () {
                        Get.find<LevelService>().debugPrintCompletedLevels();
                      },
                      child: Text('Print Completed Levels'),
                    ),*/

                    // Controls during game
                    InlineButton(onPressed: () => Get.to(() => ResultScreen()), buttonText: "End Game",), // End Game
                    Expanded(
                      child: FittedBox(
                        child: SizedBox(
                          width: gameWidth,
                          height: gameHeight,

                          // -- EMBEDS FLAME GAME --
                          child: GameWidget(
                            game: game,
                          ),
                        ),
                      ),
                    ),
                  ],
                ), 
              ),                                             
            ),
          ),),
        
        
        
    );
  }
}
