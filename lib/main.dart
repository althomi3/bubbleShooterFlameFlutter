//Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/stylesheet.dart';


// Widgets
import 'src/widgets/start_screen.dart';

void main() {
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: StartScreen(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: yellow_b,
        textTheme: GoogleFonts.chewyTextTheme().apply(
          bodyColor: const Color(0xff184e77),
          displayColor: const Color(0xff184e77),
        ),
      ),
    );
  }
}
