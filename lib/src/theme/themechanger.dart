import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.pink,
        );
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

//  set currentTheme(ThemeData value) {
//    _currentTheme = value;
//    notifyListeners();
//  }

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xFF16202B),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xFF16202B),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  bool get customTheme => _customTheme;

  set customTheme(bool value) {
    _customTheme = value;
    notifyListeners();
  }
}
