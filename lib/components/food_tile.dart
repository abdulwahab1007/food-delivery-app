import 'package:flutter/material.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.food,
    required this.onTap
    });


  final Food food;
  final void Function()? onTap;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0,left: 15.0,right: 15.0,bottom: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children:[
            Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.name,
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    ),),
                    Text('\$${food.price}',
                    style: myPrimaryTextStyle(context : context ),),
                    const SizedBox(height: 8.0,),
                    Text(food.description,
                    style: myPrimaryTextStyle(context : context),)
                    ],
                ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(food.imagePath,
                  height: 120,
                  errorBuilder: (context,error,stackTrace){
                    return const Icon(Icons.broken_image,size: 60);
                  },
                  ),
                )
            ],),
            Divider(color: Theme.of(context).colorScheme.tertiary,)
            ],
        ),
      ),
    );

  }
}