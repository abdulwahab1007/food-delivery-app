import 'package:flutter/material.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';
import 'package:food_delivery_app/models/restaurent.dart';
import 'package:provider/provider.dart';

class MyReciept extends StatelessWidget{
  const MyReciept({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50.0,),
            Text("Thankyou for your order !",
            style: myInversePrimaryTextStyle(context: context),),
            const SizedBox(height: 20.0,),
            Container(
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.tertiary,
                width: 1.5),
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Consumer<Restaurent>(
                builder: (context,restaurent,child)=>Text(restaurent.displayCartReciept(),
                style: myInversePrimaryTextStyle(context: context),)
                )
            )
      
        
          ],
        ),
      ),
    );
  }
}