import 'package:flutter/material.dart';

class SymbolsProvider extends ChangeNotifier {
  String _currentSymbol = 'X';

  String get currentSymbol {
    return _currentSymbol;
  }

  void toggleSymbol() {
    _currentSymbol = _currentSymbol == 'X' ? 'O' : 'X';
    notifyListeners();
  }

  void deleteState() {
    _currentSymbol = 'X';
    notifyListeners();
  }
}
