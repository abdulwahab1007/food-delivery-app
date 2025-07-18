import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode=ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 17, 16, 16),
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade900,
    inversePrimary: Colors.grey.shade300,
    tertiary: Colors.black
  ),
  textTheme: GoogleFonts.poppinsTextTheme()
);