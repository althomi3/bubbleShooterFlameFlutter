import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shooter.dart';
import '../config.dart';

import 'score_card.dart';

// -- GAME-- 

class GameApp extends StatefulWidget {
  const GameApp({super.key});

 @override                                                     
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late final Shooter game;

  @override
  void initState() {
    super.initState();
    game = Shooter();
  }  


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // THEME
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.pressStart2pTextTheme().apply(
          bodyColor: const Color(0xff184e77),
          displayColor: const Color(0xff184e77),
        ),
      ),

      // BACKGROUND
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffa9d6e5),
                Color(0xfff2e8cf),
              ],
            ),
          ),

          //GAME CONTENT
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(                                  
                  children: [

                    // SCORECARD
                    ScoreCard(score: game.score),
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
          ),
        ),
      ),
    );
  }
}
