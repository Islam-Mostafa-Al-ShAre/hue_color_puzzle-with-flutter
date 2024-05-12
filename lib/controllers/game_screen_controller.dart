import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hue_color_puzzle/controllers/home_screen_controller.dart';
import 'package:hue_color_puzzle/models/Levels.dart';
import 'package:hue_color_puzzle/models/box.dart';

class GameScreenController extends GetxController {
  bool isWin = false;
  final int _stars = 0;
  late Level _currentLevel;
  RxInt _timer = 0.obs;
  RxInt _steps = 0.obs;
  Timer? _timerOpject;

  // ignore: prefer_final_fields
  late Rx<Box> _selectedBox = Box(color: Colors.black, id: -1).obs;
  //getter
  Level get currentLevel => _currentLevel;
  int get levelId => _currentLevel.levelId;
  Rx<Box> get selectedBox => _selectedBox;
  List<Box> get levelBoxs => _currentLevel.boxs;
  int get levelBoxsCount => _currentLevel.count();
  int get levelRowCount => _currentLevel.rowBoxsCount;
  int get stars => _stars;
  RxInt get timer => _timer;
  RxInt get steps => _steps;

//setters

  // public return fucntions
  bool isSelectedBox(Box box) {
    return _selectedBox.value == box;
  }

  // public void Fucntions
  void setCurrentLevel(Level level) {
    _currentLevel = level;
  }

  void setSelectedBox(Box box) {
    int preSelectedBoxId = _selectedBox.value.id;

    _selectedBox.value = box;
    if (preSelectedBoxId != -1) {
      changePosition(preSelectedBoxId);
    }
  }

  void clearSelectedBox() {
    _selectedBox.value = Box(color: Colors.black, id: -1);
  }

  void setTimer(bool running) {
    if (running) {
      _timerOpject = Timer.periodic(const Duration(seconds: 1), (timer) {
        _updateTimer();
      });
    } else {
      _timerOpject!.cancel();
    }
  }

  void shuflle(List<Box> boxs) {
    do {
      boxs.shuffle();
    } while (_checkGameWinState());
  }

  void changePosition(int prevSelectedBoxId) {
    //increase number of steps first
    _increaseSteps();
    Box prevSelectedBox =
        levelBoxs.firstWhere((element) => element.id == prevSelectedBoxId);

    Box copyOfPrev = Box(id: prevSelectedBoxId, color: prevSelectedBox.color);

    prevSelectedBox.color = _selectedBox.value.color;
    prevSelectedBox.id = _selectedBox.value.id;
    _selectedBox.value.color = copyOfPrev.color;
    _selectedBox.value.id = copyOfPrev.id;

    Future.delayed(const Duration(milliseconds: 200), () {
      clearSelectedBox();
      update();
    });

    if (_checkGameWinState()) {
      // stop timer
      setTimer(false);

      //show win dialog
      Get.defaultDialog(
        title: "good",
        middleText: " You Win!",
        barrierDismissible: false,
        confirm: GestureDetector(
            onTap: () {
              //add key to player if this is the first time player win
              if (!_currentLevel.win) Get.find<HomeScreenController>().addKey();

              //update level Status
              _updateLevelStatus();
              //go to home page
              Get.back();
              Get.offNamed("/homeScreen");
            },
            child: const Text("Home")),
        backgroundColor: Colors.green,
        titleStyle: const TextStyle(color: Colors.white),
        middleTextStyle: const TextStyle(color: Colors.white),
      );
    } else {}
  }

// private return Functions
  bool _checkGameWinState() {
    int prevId = 0;
    for (var i = 0; i < levelBoxsCount; i += levelRowCount) {
      // check if the first row  box in the right place
      if (levelBoxs[i].id % levelRowCount == 0) {
        // check row boxs in the right place
        prevId = levelBoxs[i].id;
        for (var j = i + 1; j < i + levelRowCount; j++) {
          if ((prevId + 1) == levelBoxs[j].id) {
            prevId = levelBoxs[j].id;
          } else {
            return false;
          }
        }
        prevId++;
      } else {
        return false;
      }
    }
    return true;
  }

//private void Fucntions
  void _increaseSteps() {
    _steps++;
  }

  void _updateLevelStatus() {
    _currentLevel.win = true;
    _currentLevel.timeTake = _timer.value;
    _currentLevel.stepsTake = steps.value;

    // calc  stars
    _currentLevel.stars =
        _calcStars(_currentLevel.levelMaxScore, _timer.value, steps.value);
  }

  int _calcStars(int maxScore, int time, int steps) {
    int timeMinus = time * 10;
    int stepsMinus = steps * 20;
    int totalScoreMinus = timeMinus + stepsMinus;
    int currentScore = maxScore - totalScoreMinus;
    double presntage = currentScore / maxScore * 100;

    if (presntage >= 85) {
      return 3;
    } else if (presntage >= 75) {
      return 2;
    } else {
      return 1;
    }
  }

  void _updateTimer() {
    _timer += 1;
  }
}
