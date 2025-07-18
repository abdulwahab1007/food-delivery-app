import 'package:flutter/material.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';
import 'package:food_delivery_app/models/food.dart';

class MyQuantitySelector extends StatelessWidget{
    const MyQuantitySelector({
    super.key,
    required this.onDecrement,
    required this.onIncrement,
    required this.quantity,
    required this.food
    });

  final void Function()? onDecrement;
  final void Function()? onIncrement;
  final int quantity;
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(50.0),
        
      ),
      child: Row(
        children: [
          //Decrement Counter 
          GestureDetector(
            onTap: onDecrement,
            child:  Icon(Icons.remove,
            color: Theme.of(context).colorScheme.primary,
            size: 20,),
            
          ),
          // Quantity 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 20.0,
              child: Center(
                child: Text(quantity.toString(),
                style: myInversePrimaryTextStyle(
                  context: context,
                  fontWeight: FontWeight.w600
                  ),),
              ),
            ),
          ),
          
    
          // Increment counter
          GestureDetector(
            onTap: onIncrement,
            child:  Icon(Icons.add,
            color: Theme.of(context).colorScheme.primary,
            size: 20,),
          ),
    
        ],
      ),
    );
  }
}