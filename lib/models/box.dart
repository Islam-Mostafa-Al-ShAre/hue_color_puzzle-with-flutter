import 'dart:ui';

class Box {
  int id;
  Color color;
  late bool isSelected;

  Box({required this.id, required this.color}) {
    isSelected = false;
  }
}
