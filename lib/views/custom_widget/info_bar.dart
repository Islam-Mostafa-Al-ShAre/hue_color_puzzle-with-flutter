import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hue_color_puzzle/controllers/game_screen_controller.dart';
import 'package:hue_color_puzzle/views/custom_widget/info_bar_item.dart';

class InfoBar extends StatelessWidget {
  InfoBar({super.key});
  final _gameScreenController = Get.find<GameScreenController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InfoBarItem(text: "Level", value: "${_gameScreenController.levelId}"),
        Obx(() {
          return InfoBarItem(
              text: "Timer",
              value: _gameScreenController.timer.value.toString());
        }),
        Obx(() {
          return InfoBarItem(
              text: "Steps", value: "${_gameScreenController.steps}");
        }),
      ],
    );
  }
}
