import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode=ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey[200],
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade50,
    inversePrimary: Colors.grey.shade900,
    tertiary: Colors.white
  ),
  textTheme:GoogleFonts.poppinsTextTheme()
);