import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hue_color_puzzle/views/pages/game_screen.dart';
import 'package:hue_color_puzzle/views/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(),
      initialRoute: "/homeScreen",
      getPages: [
        GetPage(name: "/gameScreen", page: () => const GameScreen()),
        GetPage(name: "/homeScreen", page: () => HomeScreen())
      ],
    );
  }
}
