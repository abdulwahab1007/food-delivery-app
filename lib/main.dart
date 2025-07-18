import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/firebase_options.dart';
import 'package:food_delivery_app/models/restaurent.dart';
import 'package:food_delivery_app/services/auth/auth_gate.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>ThemeProvider(),),
      ChangeNotifierProvider(create: (context)=>Restaurent())
    ],
    child: const MyApp(),
    )
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // Here we go InshAllah ! 
      home:  const AuthGate(),
        theme: Provider.of<ThemeProvider>(context).themeData,
      );
  }
}
