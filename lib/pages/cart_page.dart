import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/cart_tile.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/restaurent.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget{
  const CartPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurent>(builder: (context,restaurent,chlid){
        // I want the cart from the Restraunt 
        final List<CartItem> cart=restaurent.cart;
         bool isDarkMode= Provider.of<ThemeProvider>(context,listen: false).isDarkMode;

         return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              centerTitle: true ,
              title: const Text("Cart",),
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  onPressed: (){
                    showDialog(
                      context: context, 
                      builder: (context)=> AlertDialog(
                        contentTextStyle: myPrimaryTextStyle(context: context),
                        title: Center(
                          child: Text("Clear All Cart",
                          style: myInversePrimaryTextStyle(context: context,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                        ),
                        content: Text(" Are you sure you want to clear everything in the cart ?",
                        style: myPrimaryTextStyle(context: context),),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            }, 
                            child: const Text("cancel"),
                            ),
                            TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                              restaurent.clearCart();
                            }, 
                            child: const Text("yes"),
                            )
                        ],
                      ),
                      );
                  }, 
                  icon: const Icon(Icons.delete_outline)
                  )
              ],
            ),
            body: cart.isEmpty ?  Center(child: Text("cart is empty..",
            style: myInversePrimaryTextStyle(context: context),),): Column(
              children: [
                 Expanded(
                   child: Column(
                          children: [
                          Expanded(
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context,index){
                        //get an individual item 
                        final item=cart[index];
                        // in here , instead of this List Tile , we are going to make a Cart Tile 
                        return CartTile(
                          cartItem: item
                          );
                      }
                   
                      )
                    )
                                 ],
                               ),
                 ),

            // go to check out button 
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0,left: 20.0,right: 20.0,top: 8.0),
              child: MyButton(
                text: "Go To Checkout", 
                onTap: (){
                 cart.isNotEmpty ?  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=>const PaymentPage()
                  )) : showDialog(
                    context: context, 
                    builder: (context)=>AlertDialog(
                      content: Text("There is no item in the cart !",
                      style: myPrimaryTextStyle(context: context),),
                    )
                    );
                }, // go the payment page 
                colors: isDarkMode ?[
                          const Color(0xFF232526) , const Color(0xFF414345)
                      ]:[const Color(0xFFFFFFFF), const Color(0xFFCCCCCC),]
                ),
            )
              ],
            )
         );

    });
  }
}