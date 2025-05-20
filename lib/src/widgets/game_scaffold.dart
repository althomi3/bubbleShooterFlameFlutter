import 'package:flutter/material.dart';
import 'package:flutter_flame_bubble_shooter_game/src/config.dart';

class GameScaffold extends StatelessWidget {
  final List<Widget> content;
  final Widget? body; // body needed to start app

  const GameScaffold({this.content = const [], this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: responsiveMaxWidth),
          child: Stack(
            children: [
              Positioned.fill(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: responsiveMaxWidth), // --- sets maxwidth for screens and game
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/galaxy_bg_1.jpg',
                        ), // path must match pubspec.yaml
                        fit: BoxFit.cover, // covers entire screen
                      ),
                    ),
                  ),
                ),
              ),

              Center(
                child:
                    body ??
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: content,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
