import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hue_color_puzzle/controllers/game_screen_controller.dart';
import 'package:hue_color_puzzle/controllers/home_screen_controller.dart';
import 'package:hue_color_puzzle/helpers/spaces.dart';
import 'package:hue_color_puzzle/views/custom_widget/game_grid.dart';
import 'package:hue_color_puzzle/views/custom_widget/info_bar.dart';

//-------------------------------------------------
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameScreenController _gameScreenController =
      Get.put<GameScreenController>(GameScreenController());

  @override
  void initState() {
    super.initState();
    _gameScreenController
        .setCurrentLevel(Get.find<HomeScreenController>().currentLevel!);
    _gameScreenController.shuflle(_gameScreenController.levelBoxs);

    // start timer
    _gameScreenController.setTimer(true);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _gameScreenController.clearSelectedBox,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  onPressed: () => Get.offNamed("homeScreen"),
                  icon: const Icon(Icons.arrow_back))
            ],
          ),
          backgroundColor: Colors.grey.shade200,
          body: const SafeArea(child: _BulidGameScreenUI())),
    );
  }
}

//-------------------------------------------------
class _BulidGameScreenUI extends StatelessWidget {
  const _BulidGameScreenUI();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const VerticalSpace(height: 100),
          InfoBar(),
          const VerticalSpace(height: 50),
          BulidGrid(),
        ],
      ),
    );
  }
}
