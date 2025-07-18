import 'package:flutter/material.dart';
import 'package:food_delivery_app/themes/dark_mode.dart';
import 'package:food_delivery_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  // I need a default theme

  ThemeData _themeData=lightMode;  // At first theme will be in light mode 

  // getters 
  
  ThemeData get themeData=>_themeData;
  // is Dark Mode

  bool get isDarkMode=>_themeData==darkMode;

  //setters 

  setThemeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();
  } 

  //toggle theme

  toggleTheme(){
    if(_themeData==lightMode){
      setThemeData(darkMode);
    }
    else{
      setThemeData(lightMode);
    }
  }

}