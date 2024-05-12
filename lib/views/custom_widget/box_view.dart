import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hue_color_puzzle/controllers/game_screen_controller.dart';
import 'package:hue_color_puzzle/models/box.dart';

class BoxView extends StatelessWidget {
  const BoxView({
    super.key,
    required GameScreenController gameScreenController,
    required this.box,
  }) : _gameScreenController = gameScreenController;

  final GameScreenController _gameScreenController;
  final Box box;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_gameScreenController.selectedBox.value == box) {
          //if clicked in the same selected box;
          _gameScreenController.clearSelectedBox();
        } else {
          _gameScreenController.setSelectedBox(box);
        }
      },
      child: Obx(
        () {
          return AnimatedPadding(
            curve: Curves.bounceInOut,
            duration: const Duration(milliseconds: 300),
            padding: _gameScreenController.selectedBox.value == box
                ? const EdgeInsets.all(0)
                : const EdgeInsets.all(5),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Container(
                key: ValueKey(box.id),
                color: box.color,
              ),
            ),
          );
        },
      ),
    );
  }
}
