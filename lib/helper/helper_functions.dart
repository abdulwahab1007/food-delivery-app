import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showErrorMessage(BuildContext context,String error){
  showDialog(context: context, 
  builder: (context)=>AlertDialog(
    backgroundColor: Theme.of(context).colorScheme.secondary,
    content: Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(error,
      style: GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.inversePrimary,
        fontSize: 16,
      ),),
    ),
  )
  );
}


TextStyle myPrimaryTextStyle({required BuildContext context,double? fontSize,FontWeight? fontWeight}
)=> GoogleFonts.poppins(
  color: Theme.of(context).colorScheme.primary,
  fontSize : fontSize ?? 14 ,//default body size
  fontWeight: fontWeight ?? FontWeight.normal
);

TextStyle mySecondaryTextStyle(BuildContext context)=> GoogleFonts.poppins(
  color: Theme.of(context).colorScheme.secondary
);


TextStyle myInversePrimaryTextStyle({required BuildContext context,double? fontSize,FontWeight? fontWeight})=> GoogleFonts.poppins(
  color: Theme.of(context).colorScheme.inversePrimary, 
  fontSize : fontSize ?? 14 ,//default body size
  fontWeight: fontWeight ?? FontWeight.normal
);