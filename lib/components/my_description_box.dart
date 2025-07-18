import 'package:flutter/material.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0,bottom: 25.0),
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary,
          width: 2
          ),
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("\$0.99",
              style: myPrimaryTextStyle(context: context),),
              Text("Delivery fee",
              style: myInversePrimaryTextStyle(context: context),)
            ],
          ),
    
           Column(
            children: [
              Text(" 15-30 mins",
              style: myPrimaryTextStyle(context: context),),
              Text("Delivery time",
              style: myInversePrimaryTextStyle(context: context),)
            ],
          ),
        ],
      ),
    );
  }
}