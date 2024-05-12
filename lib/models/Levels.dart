// ignore: file_names
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hue_color_puzzle/models/box.dart';

class Level {
  final int rowBoxsCount;
  final int levelId;
  final int levelBoxsCount;
  final List<Box> _Boxs = [];
  int levelMaxScore = 0;
  bool _isOpen = false;
  bool _win = false;
  int _stars = 0;
  int _timeTake = 0;
  // ignore: unused_field
  int _stepsTake = 0;

  List<Box> get boxs => _Boxs;
  bool get isOpen => _isOpen;
  bool get win => _win;
  int get timeTake => _timeTake;
  int get stars => _stars;
  set win(bool win) {
    _win = win;
  }

  set timeTake(int time) {
    _timeTake = time;
  }

  set stepsTake(int steps) {
    _stepsTake = steps;
  }

  set stars(int stars) {
    _stars = stars;
  }

  Level({
    required this.levelBoxsCount,
    required this.rowBoxsCount,
    required this.levelId,
  }) {
    _genarteColors();
    levelMaxScore = levelId * 200 + 500;
  }

  int count() {
    return _Boxs.length;
  }

  void open() {
    _isOpen = true;
  }

  void _genarteColors() {
    int red = 1;
    int green = 1;
    int blue = 1;
    int opacity = 255;
    for (var i = 0; i < levelBoxsCount; i++) {
      if (i % rowBoxsCount == 0) {
        opacity = 1;
        red = Random().nextInt(256);
        green = Random().nextInt(256);
        blue = Random().nextInt(256);
      }
      opacity -= 50;
      Color color = Color.fromARGB(opacity, red, green, blue);

      _Boxs.add(Box(id: i, color: color));
    }
  }
}
