import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_text_field.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';
import 'package:food_delivery_app/services/auth/auth_services.dart';
import 'package:google_fonts/google_fonts.dart';


/// Right now the Goal is to complete the Authentication for our App , in these sessions 
class RegisterPage extends StatefulWidget{
   const RegisterPage({
    super.key,
    required this.onTap
    });

  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controller
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController confirmPasswordController=TextEditingController();




  //Login Method 

  void register()async{
    final authServices=AuthServices();

    if(passwordController.text==confirmPasswordController.text){
      try{
      authServices.createUserWithEmailAndPassword(
        emailController.text.trim(), 
        passwordController.text.trim()
        );
    }catch(e){
      showErrorMessage(context, e.toString());
    }
    }
    else{
      showErrorMessage(context, "Passwords didn't matched");
    }
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
                    Text('Let\'s create an account for you ',
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
                     MyTextField(
                      hintText: "CONFIRM PASSWORD",
                      controller: confirmPasswordController, 
                      obscureText: true,
                    ),
                  
              
                      //Sign in button 
                      const SizedBox(height: 50.0,),
                      
                       MyButton(
                        text: "Register",
                        onTap: register,
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
                          Text("Already a member ?",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary
                          ),),
              
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(" Log in ",
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