//Packages
import 'package:flutter/material.dart';
import 'package:flutter_flame_bubble_shooter_game/src/services/gameservices.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/config.dart';
import 'package:hive_flutter/hive_flutter.dart';



// Widgets
import 'src/widgets/start_screen.dart';
import 'src/services/levelservice.dart';

Future<void> main() async {

  // Initialized Hive for persistent data usage
  await Hive.initFlutter();
  await Hive.openBox("storage");

  
  Get.lazyPut(() => Gameservices()); // registers gameservice
  Get.lazyPut(() => LevelService()); // registers gameservice

  await Get.find<LevelService>().loadCompletedLevels(); // loads completed levels on app start to inject info for enabling/disabling levels in levels screen



  runApp(GameApp());
}

class GameApp extends StatelessWidget {
 
  
  @override
  Widget build(BuildContext context) {
    

    return GetMaterialApp(
      initialRoute: '/',
      home: StartScreen(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: black_a,
        textTheme: GoogleFonts.orbitronTextTheme().apply(
          bodyColor: white_a,
          displayColor: const Color(0xff184e77),
        ),
      ),
    );
  }
}
