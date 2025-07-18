import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurent.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget{
  FoodPage({
    super.key,
    required this.food
    }){
      //in this constructor body 
      // initialize all the add ons to be false 
      for(AddOn addon in food.availableAddons){
        selectedAddOn[addon]=false; // this way we are also copying all the add ons to this map 
      }
    }

  final Food food;
  final Map<AddOn,bool> selectedAddOn={};

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {


  //addToCart 
  addToCart(Food food,Map<AddOn,bool>selectedAddOn){
    //when it is pressed , go back to the menu page 
    Navigator.pop(context);

    //convert the map into a list 
    List<AddOn> currentlySelectedAddOn=[];

    for(AddOn addon in widget.food.availableAddons){
      if(selectedAddOn[addon]==true){
        currentlySelectedAddOn.add(addon);
      }
    }

    //add to cart 
    context.read<Restaurent>().addToCart(food, currentlySelectedAddOn);


  }

  @override
  Widget build(BuildContext context) {

    bool isDarkMode=Provider.of<ThemeProvider>(context,listen: false).isDarkMode;
    return Stack(
      children: [
        //scaffodl UI
          Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food Image 
            Image.asset(widget.food.imagePath,
            errorBuilder: (context,error,stackTrace){
              return const Icon(Icons.broken_image);
            },),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0,),
                  //Title
                  Text(widget.food.name,
                  style: myInversePrimaryTextStyle(
                    context: context,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),),
                    const SizedBox(height: 5.0,),
                  //price 
                  Text("\$${widget.food.price}",
                  style: myPrimaryTextStyle(context: context),),
                  const SizedBox(height: 10.0,),
                  // description  
                  Text(widget.food.description,
                  style: myInversePrimaryTextStyle(context: context),),
        
                  const SizedBox(height: 10.0,),
        
                  Divider(
                    color: Theme.of(context).colorScheme.tertiary,
                    thickness: 2.0,
                  ),
                  const SizedBox(height: 10.0,),

        
                  // Add Ons 
        
                  Text("Add-Ons",
                  style: myInversePrimaryTextStyle(context: context,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),),
                  const SizedBox(height: 10.0,),
                  
        
                  //List of Add ons 
        
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary,
                        width: 2.0
                      )
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,  // Just wrap around the content
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context,index){
                        // return a checkList tile 
                        //get an individual Addon
                        final AddOn addon=widget.food.availableAddons[index];
                        return CheckboxListTile(
                          activeColor: Colors.green,
                          checkColor: Theme.of(context).colorScheme.tertiary,
                          title: Text(addon.name),
                          subtitle: Text("\$${addon.price}",
                          style: myPrimaryTextStyle(context: context),),
                          value: widget.selectedAddOn[addon], 
                          onChanged: (bool? value){
                            setState(() {
                              //change the value in the selecteed Add on s map 
                              widget.selectedAddOn[addon]=value!;
                            });
                          }
                        );
                      }
                      ),
                  ),
                  const SizedBox(height: 20.0,),

                    // Cart button

                    MyButton(
                      text: "Add to Cart", 
                      onTap: ()=>addToCart(widget.food,widget.selectedAddOn),
                      colors:  isDarkMode ?[
                          const Color(0xFF232526) , const Color(0xFF414345)
                      ]:[const Color(0xFFFFFFFF), const Color(0xFFCCCCCC),]
                      ),
                      const SizedBox(height: 20.0,)
                      
        
                ],
              ),
            )
          ],
        ),
      ),
    ),

      // on top of it , create a back button 
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,top: 10.0),
          child: IconButton(
            onPressed: ()=>Navigator.pop(context), 
            icon:  Icon(Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.tertiary,)
            ),
        ),
      )   
     
      ],
    );
  }
}