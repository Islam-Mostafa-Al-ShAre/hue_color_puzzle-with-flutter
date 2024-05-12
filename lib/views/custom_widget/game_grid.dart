import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hue_color_puzzle/controllers/game_screen_controller.dart';
import 'package:hue_color_puzzle/models/box.dart';
import 'package:hue_color_puzzle/views/custom_widget/box_view.dart';

class BulidGrid extends StatelessWidget {
  BulidGrid({
    super.key,
  });
  final GameScreenController _gameScreenController =
      Get.find<GameScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: 400),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: GetBuilder<GameScreenController>(builder: (context) {
            return GridView.builder(
              itemCount: _gameScreenController.currentLevel.count(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _gameScreenController.levelRowCount,
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                Box box = _gameScreenController.currentLevel.boxs[index];
                return BoxView(
                    gameScreenController: _gameScreenController, box: box);
              },
            );
          }),
        )
      ],
    );
  }
}
