import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var primaryColor = Colors.pink;
  var accentColor = Colors.amber;
  var tm = ThemeMode.system;

  themeModeChange(newThemeVal) async{
    tm = newThemeVal;
    notifyListeners();
  }

  MaterialColor _toMaterialColor(colorVal) {
    return MaterialColor(
      colorVal,
      <int, Color>{
        50: Color(0xFFFCE4EC),
        100: Color(0xFFF8BBD0),
        200: Color(0xFFF48FB1),
        300: Color(0xFFF06292),
        400: Color(0xFFEC407A),
        500: Color(colorVal),
        600: Color(0xFFD81B60),
        700: Color(0xFFC2185B),
        800: Color(0xFFAD1457),
        900: Color(0xFF880E4F),
      },
    );
    
  }

  onChange(newColor, n) async{
    n == 1
        ? primaryColor = _toMaterialColor(newColor.hashCode)
        : accentColor = _toMaterialColor(newColor.hashCode);
    notifyListeners();
  }
}
