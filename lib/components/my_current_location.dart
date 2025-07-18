import 'package:flutter/material.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';
import 'package:food_delivery_app/models/restaurent.dart';
 import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
 
class MyCurrentLocation extends StatefulWidget{
    const MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  final TextEditingController locationController=TextEditingController();

  void openLocationSearchBox(BuildContext context){
    showDialog(
      context: context, 
      builder: (context)=>AlertDialog(
        title: Text("Your Location",
        style: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontWeight: FontWeight.w600,
          fontSize: 30
        ),),
        content: TextField(
          controller: locationController,
          decoration: InputDecoration(
            hintText: "Search address",
            hintStyle: myPrimaryTextStyle(context:context)
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: ()=>Navigator.pop(context),
            textColor: Theme.of(context).colorScheme.inversePrimary,
            child: const Text("Cancel"),
            ),
            MaterialButton(
            textColor: Theme.of(context).colorScheme.inversePrimary,
            onPressed: (){
              Provider.of<Restaurent>(context,listen: false).updateDeliveryAddress(locationController.text);
              locationController.clear();
              Navigator.pop(context);

            },
            child: const Text("Save"),
            )
        ],
      ) 
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0),
      child:Consumer<Restaurent>(
        builder: (context,restaurent,child){
          return  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver now  ",
          style: myPrimaryTextStyle(context:context)
          ),
          GestureDetector(
            onTap: ()=>openLocationSearchBox(context), // openLocationSearchBox
            child:  Row(
              children:  [
                Text(restaurent.deilveryAddress,
                style:GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
                Icon(Icons.keyboard_arrow_down_rounded,
                color: Theme.of(context).colorScheme.inversePrimary,
                )
              ],
            ),
          )
        ],
      );
        }
        )
    );
  }
}