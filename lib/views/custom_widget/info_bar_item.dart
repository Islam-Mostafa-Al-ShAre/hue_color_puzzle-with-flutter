// ignore: unused_element
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfoBarItem extends StatelessWidget {
  InfoBarItem({super.key, required this.text, required this.value});
  final String text;
  String value;
  @override
  Widget build(BuildContext context) {
    if (text == "Timer") {
      int intValue = int.parse(value);
      int seconds = intValue % 60;
      int mins = intValue ~/ 60;

      value = "$mins : $seconds ";
    }
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
