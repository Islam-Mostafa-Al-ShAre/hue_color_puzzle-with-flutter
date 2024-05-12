import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hue_color_puzzle/controllers/home_screen_controller.dart';
import 'package:hue_color_puzzle/views/pages/home_screen.dart';

class KeysNumber extends StatelessWidget {
  const KeysNumber({
    super.key,
    required HomeScreenController homeScreenController,
  }) : _homeScreenController = homeScreenController;

  final HomeScreenController _homeScreenController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.key_sharp,
          color: primaryColor,
          size: 40,
        ),
        Obx(
          () {
            return Text(
              "${_homeScreenController.keysCount.value}",
              style: const TextStyle(fontSize: 20),
            );
          },
        )
      ],
    );
  }
}
