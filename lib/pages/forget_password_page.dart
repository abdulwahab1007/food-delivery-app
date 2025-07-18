
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_text_field.dart';
import 'package:google_fonts/google_fonts.dart';



class ForgetPasswordPage extends StatefulWidget{
   const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  //controller
   final TextEditingController resetPasswordController=TextEditingController();

 
    
  // reset Password method 

   void resetPassword()async{
    // if(resetPasswordController.text.isNotEmpty){
    //   try{
    //     await FirebaseAuth.instance.sendPasswordResetEmail( 
    //       email: resetPasswordController.text.trim()
    //       );
    //     //if all went Good , tell the User we have sent the link 
    //     showErrorMessage(
    //       context, "We have sent you a link on your email "
    //       );
    //       resetPasswordController.clear();

    //   }on FirebaseAuthException catch(e){
    //     showErrorMessage(context, e.message!);
    //     resetPasswordController.clear();
    //    }
    //   }
   }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("Forgot Password ?",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary
            )),
            const SizedBox(height: 10.0,),

            Text("No worries we'll send you a reset Link ! ",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
            ),),

            const SizedBox(height: 60,),
            MyTextField(
              hintText: "example@gmail.com",
              controller: resetPasswordController,
              obscureText: false
              ),
              const SizedBox(height: 30.0,),

              //button 
              MyButton(
                text: "Reset Password ", 
                onTap: resetPassword
                ),

                //back to login 
                const SizedBox(height: 20.0,),

                 GestureDetector(
                  onTap: ()=>Navigator.pop(context),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back,
                      color: Theme.of(context).colorScheme.primary,),
                   
                      Text("  Back to log in ",
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14
                      ),)
                    ],),
                 )
          ],
        ),
      ),
    );
  }
}