 
import 'package:food_delivery_app/models/food.dart';

class CartItem { // this class is for each cart Item 

  Food food;
  List<AddOn> selectedAddOn;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddOn,
    this.quantity=1,  // defaultly the quantity will be one 
  });

  //get the total price including the add ons 

   double get totalPrice{
    // So we are going to use a fold method , which will work for us as a for loop iterator ,for summing or any ALU operation we want to do 

    double addonsPrice=selectedAddOn.fold(0, (sum,addon)=>sum+addon.price);

    return (food.price+addonsPrice)* quantity;
  }

}