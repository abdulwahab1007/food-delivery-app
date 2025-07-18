import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_text_field.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';
import 'package:food_delivery_app/pages/forget_password_page.dart';
import 'package:food_delivery_app/services/auth/auth_services.dart';
import 'package:google_fonts/google_fonts.dart';


/// Right now the Goal is to complete the Authentication for our App , in these sessions 
class LoginPage extends StatefulWidget{
   const LoginPage({
    super.key,
    required this.onTap
    });

  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controller
  final TextEditingController emailController=TextEditingController();

  final TextEditingController passwordController=TextEditingController();


  final AuthServices _authServices=AuthServices();
  //Login Method 

  void login()async{
   
    // fill out the authentication 
   try{
     await _authServices.signInWithEmailAndPassword(
      emailController.text.trim(), 
      passwordController.text.trim()
      );
   }catch(e){
    showErrorMessage(context, e.toString());
   }

    // for now we'll be just pushing to the home Page 
    
  }  
   
  @override
  Widget build(BuildContext context) {

   

    return   Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:  Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(height: 10.0,),
                  //Icon
                  Icon(Icons.lock_open,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,),
              
                    // text (welcome back, you have been missed )
                    const SizedBox(height: 50,),
                    Text('Food Delivery App',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary
                    ),),
                    const SizedBox(height: 20.0,),
              
                    //email TextField 
                    MyTextField(
                      hintText: "EMAIL",
                      controller: emailController,
                      obscureText: false,
                    ),
                    const SizedBox(height: 10.0,),
                    //password textfield 
                    MyTextField(
                      hintText: "PASSWORD",
                      controller: passwordController, 
                      obscureText: true,
                    ),
                  
                    const SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context, MaterialPageRoute(builder: (context)=>
                                 const  ForgetPasswordPage())
                                );
                            }, // on tap push to the ForgetpasswordPage

                            //forget password
                            child: Text("Forget Password ?",
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                            ),),
                          )
                      ],
                      ),
              
                      //Sign in button 
                      const SizedBox(height: 40.0,),
                       MyButton(
                        text: "Sign in",
                        onTap: login,
                        ),
              
                        //or sign in with 
                        const SizedBox(height: 40.0,),
                        Row(
                          children: [
                             Expanded(
                              child: Divider(
                                  color: Theme.of(context).colorScheme.primary
                              )
                              ),
                               Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                 child: Text(" Or ",
                                    style: GoogleFonts.poppins(
                                      color: Theme.of(context).colorScheme.primary
                                    ),),
                               ),
                                Expanded(
                                child: Divider(
                                  color: Theme.of(context).colorScheme.primary
                                )
                                ),                             
                          ],
                        ),
                        // Never Forget to enjoy your life in the present moment honey , Just never do it , Enjoy Each and every ounce of your life ! 
              
                        //Apple and Google Icon
                        const SizedBox(height: 50.0,),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text("Not a member ?",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary
                          ),),
              
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(" Register Now ",
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                            ),),
                          )
                        ],)
                        
                        
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}