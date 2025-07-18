import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/login_or_register_page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
      return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), //it checks if any user is logged in or not , and the stream waits for the function to give an answer
        builder: (context,snapshot){
          if(snapshot.hasData){
            //show Home Page 
            return const HomePage();
          }
          else {
            return const LoginOrRegisterPage();
          }
        }
        );
  }
}