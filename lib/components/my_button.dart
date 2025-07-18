import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget{
   const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.colors
    });

  final String text;
  final void Function()? onTap;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            colors: colors ?? const [Color(0xFF7F00FF), Color(0xFFE100FF)]
            ),


          borderRadius: BorderRadius.circular(12.0)
        ),
        child: Center(
          child: Text(text,
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),),
        ),
      ),
    );
  }
}