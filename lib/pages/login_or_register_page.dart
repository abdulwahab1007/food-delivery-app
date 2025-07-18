import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/login_page.dart';
import 'package:food_delivery_app/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {

  bool isShowLoginPage=true;  


  //togglePages
  void togglePages(){
    setState(() {
      isShowLoginPage=!isShowLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(isShowLoginPage){
      return LoginPage(onTap: togglePages);
    }
    else{
      return RegisterPage(onTap: togglePages);
    }
  }
}