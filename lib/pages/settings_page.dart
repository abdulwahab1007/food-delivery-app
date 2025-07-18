import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Theme.of(context).colorScheme.tertiary)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text("Dark Mode",
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),),
                   CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context,listen: false).isDarkMode,
                    onChanged: (value){
                      Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
                    }
                    )
              
                ],
              ),
            ),
          )
        ],
        
      ),
    );
  }
}