import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget{
   const MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText
    });


  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.green.shade800),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.primary
          )
      ),
    );
  }
}