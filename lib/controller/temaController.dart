import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TemaController extends ChangeNotifier {
  static bool _isDark = true;

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  bool getStateTheme() {
    return _isDark;
  }
}
