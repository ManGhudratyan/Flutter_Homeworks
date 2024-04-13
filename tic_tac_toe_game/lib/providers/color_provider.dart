import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  List<bool> _colors = List.filled(9, false);

  Color getColor(int index) {
    return _colors[index]
        ? const Color.fromARGB(255, 59, 64, 92)
        : const Color.fromRGBO(33, 40, 53, 1.00);
  }

  Color getContainerBorderColor(List<String?> board, int index) {
    String? symbol = board[index];
    if (symbol == 'X') {
      return Colors.blue;
    } else if (symbol == 'O') {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  void changeColor(int index) {
    _colors[index] = !_colors[index];
    notifyListeners();
  }

  void deleteState() {
    _colors = List.filled(9, false);
    notifyListeners();
  }
}
