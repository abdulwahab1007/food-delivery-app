import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_quantity_selector.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/restaurent.dart';
import 'package:provider/provider.dart';
 
class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.cartItem
    });
  
  final CartItem cartItem;
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurent>(builder: (context,restaurent,chlid){
      return Container(
        padding: const EdgeInsets.only(top: 10.0,left: 5.0,bottom: 5.0),
      margin: const EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //food image 
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(cartItem.food.imagePath,
                  height: 100,),
                ),
              ),
        
              // price and name 
        
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text(cartItem.food.name,
                  style: myInversePrimaryTextStyle(
                    context: context,
                    fontWeight: FontWeight.w600,
                    fontSize: 14
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    ),
                  Text("\$${cartItem.food.price}",
                  style: myPrimaryTextStyle(
                    context: context,
                    fontWeight: FontWeight.w600
                    ),),
                        
                ],),
              ),
              const Spacer(),
              //quantity selector 
              SizedBox(
                child: MyQuantitySelector(
                  onDecrement: ()=>restaurent.remmoverFromCart(cartItem), 
                  onIncrement: ()=>restaurent.addToCart(cartItem.food,cartItem.selectedAddOn), 
                  quantity: cartItem.quantity, 
                  food: cartItem.food
                  ),
              )
        
            ],
          ),
          
          // ListView for Add Ons 
         SizedBox(
          height: cartItem.selectedAddOn.isEmpty ? 0 : 60 ,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 10.0),
            children: cartItem.selectedAddOn.map((addon){
              return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: FilterChip(
                  label: Row(
                    children: [
                      Text(addon.name,
                      style: myPrimaryTextStyle(
                        context: context,
                        fontSize: 12
                        ),),
                      Text("  \$${addon.price}",
                      style: myPrimaryTextStyle(context: context),)
                    ],
                  ), 
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary
                    )
                  ),
                  onSelected: (value){}
                  ),
              );
            }).toList(),
          ),
         )

        ],
       ),
      );
    });
  }
}