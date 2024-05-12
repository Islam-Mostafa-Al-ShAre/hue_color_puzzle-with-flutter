import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:hue_color_puzzle/models/Levels.dart';

class HomeScreenController extends GetxController {
  List<Level> _levels = [];
  RxInt _keysCount = 3.obs;
  Level? currentLevel;
  RxInt get keysCount => _keysCount;
  List<Level> get levels => _levels;
  int get levelCount => _levels.length;

  void addKey() {
    _keysCount++;
  }

  void _removeKey() {
    _keysCount--;
  }

  void openLevel(int index) {
    if (_keysCount > 0) {
      _removeKey();
      _levels[index].open();
      update();
    }
  }

  void setLevels() {
    _levels = [
      Level(rowBoxsCount: 2, levelId: 1, levelBoxsCount: 4),
      Level(rowBoxsCount: 2, levelId: 2, levelBoxsCount: 6),
      Level(rowBoxsCount: 3, levelId: 3, levelBoxsCount: 6),
      Level(rowBoxsCount: 3, levelId: 4, levelBoxsCount: 12),
      Level(rowBoxsCount: 3, levelId: 5, levelBoxsCount: 12),
      Level(rowBoxsCount: 3, levelId: 6, levelBoxsCount: 18),
      Level(rowBoxsCount: 4, levelId: 7, levelBoxsCount: 20),
      Level(rowBoxsCount: 4, levelId: 8, levelBoxsCount: 24),
      Level(rowBoxsCount: 4, levelId: 9, levelBoxsCount: 28),
      Level(rowBoxsCount: 4, levelId: 10, levelBoxsCount: 36),
      Level(rowBoxsCount: 2, levelId: 1, levelBoxsCount: 4),
      Level(rowBoxsCount: 2, levelId: 2, levelBoxsCount: 6),
      Level(rowBoxsCount: 3, levelId: 3, levelBoxsCount: 6),
      Level(rowBoxsCount: 3, levelId: 4, levelBoxsCount: 12),
      Level(rowBoxsCount: 3, levelId: 5, levelBoxsCount: 12),
      Level(rowBoxsCount: 3, levelId: 6, levelBoxsCount: 18),
      Level(rowBoxsCount: 4, levelId: 7, levelBoxsCount: 20),
      Level(rowBoxsCount: 4, levelId: 8, levelBoxsCount: 24),
      Level(rowBoxsCount: 4, levelId: 9, levelBoxsCount: 28),
      Level(rowBoxsCount: 4, levelId: 10, levelBoxsCount: 36),
      Level(rowBoxsCount: 2, levelId: 1, levelBoxsCount: 4),
      Level(rowBoxsCount: 2, levelId: 2, levelBoxsCount: 6),
      Level(rowBoxsCount: 3, levelId: 3, levelBoxsCount: 6),
      Level(rowBoxsCount: 3, levelId: 4, levelBoxsCount: 12),
      Level(rowBoxsCount: 3, levelId: 5, levelBoxsCount: 12),
      Level(rowBoxsCount: 3, levelId: 6, levelBoxsCount: 18),
      Level(rowBoxsCount: 4, levelId: 7, levelBoxsCount: 20),
      Level(rowBoxsCount: 4, levelId: 8, levelBoxsCount: 24),
      Level(rowBoxsCount: 4, levelId: 9, levelBoxsCount: 28),
      Level(rowBoxsCount: 4, levelId: 10, levelBoxsCount: 36),
    ];
  }
}
