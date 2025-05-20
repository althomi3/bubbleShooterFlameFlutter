import 'package:flutter/material.dart';


class GameScaffold extends StatelessWidget {
  final List<Widget> content;
  const GameScaffold({required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('galaxy_bg_1.jpg'), // path must match pubspec.yaml
                fit: BoxFit.cover, // covers entire screen
              ),
            ),
          ),
      
      
      
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: content,
        ),
      ),
        ],
    ),
    );
  }
}