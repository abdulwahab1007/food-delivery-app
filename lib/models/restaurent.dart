import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaurent extends ChangeNotifier{
  /*
     So this class will organize the most of the functionality and the logic , 
     for the restaurent  
   */

  // menu 

  final List<Food> _menu=[
    // burgers
         Food(
        name: "Beef Burger", 
        description: "Juicy grilled beef patty layered with fresh lettuce, tomato, and melted cheese in a toasted sesame bun.", 
        imagePath: "lib/images/burgers/beef_burger.png", 
        price: 4.99, 
        category: FoodCategory.burgers, 
        availableAddons: [
          AddOn(name: "Extra Cheese", price: 0.99),
          AddOn(name: "Grilled Onion", price: 1.49),
          AddOn(name: "Avacado", price: 1.99),
          ]
        ),
         Food(
        name: "Cheesy Lava Burger", 
        description: "Ooey-gooey molten cheddar inside a juicy beef patty — melty, messy, and made to satisfy every cheese lover.", 
        imagePath: "lib/images/burgers/cheesy_lava_burger.png", 
        price: 10.99, 
        category: FoodCategory.burgers, 
        availableAddons: [
          AddOn(name: "Extra Cheese", price: 1.49),
          AddOn(name: "Grilled Onion",  price: 1.49),
          AddOn(name: "Avacado", price: 1.49),
        ]
        ),
         Food(
        name: "Double Stack Melt", 
        description: "JTwo flame-grilled beef patties smothered in melted cheese, stacked high with caramelized onions and smoky mayo.", 
        imagePath: "lib/images/burgers/double_stack_melt.png", 
        price: 8.99, 
        category: FoodCategory.burgers, 
        availableAddons: [
          AddOn(name: "Extra Cheese",  price: 1.49)
        ]
        ),
         Food(
        name: "Smoky BBQ Crunch", 
        description: "Smoky barbecue-glazed beef topped with crispy onion rings, pickles, and creamy ranch on a sesame bun.",
        imagePath: "lib/images/burgers/beef_burger.png", 
        price: 9.99, 
        category: FoodCategory.burgers, 
        availableAddons: [
          AddOn(name: "Extra Cheese",   price: 1.49)
        ]
        ),
         Food(
        name: "Spicy Firecracker Patty", 
        description: "A bold, fiery beef burger with jalapeños, spicy mayo, and pepper jack cheese that packs the perfect punch.", 
        imagePath: "lib/images/burgers/spicy_firecracker_patty.png", 
        price: 12.99, 
        category: FoodCategory.burgers, 
        availableAddons: [
          AddOn(name: "Extra Cheese",price: 1.49)
        ]
        ),
    // sides
        Food(
        name: "Golden Crunch Fries",
        description: "Crispy, golden shoestring fries seasoned to perfection",
        imagePath: "lib/images/sides/golden_crunch_fries.png",
        price: 4.99,
        category: FoodCategory.sides,
        availableAddons: [
          AddOn(name: "Extra Cheese", price: 0.99),
        ]),
    Food(
        name: "Garlic Butter Breadstick",
        description:
            "Soft breadsticks brushed with garlic butter and herbs — perfect for dipping.",
        imagePath: "lib/images/sides/garlic_buttter_breadsticks.png",
        price: 6.99,
        category: FoodCategory.sides,
        availableAddons: [
          AddOn(name: "Extra Cheese", price: 0.99),
        ]),
    Food(
        name: "Chaddar Cheese Bites",
        description:
            "Melted chaddar goodness packed into crispy, bite-sized snacks.",
        imagePath: "lib/images/sides/chaddar_cheese_bites.png",
        price: 7.49,
        category: FoodCategory.sides,
        availableAddons: [
          AddOn(name: "Extra Cheese", price: 0.99),
        ]),
    Food(
        name: "Loaded Potato Wedges",
        description:
            "Thick-cut wedges topped with sour cream, bacon bits, and melted cheese.",
        imagePath: "lib/images/sides/loaded_potato_wedges.png",
        price: 4.99,
        category: FoodCategory.sides,
        availableAddons: [
          AddOn(name: "Extra Cheese", price: 0.99),
        ]),
    Food(
        name: "Spicy Jalapeño Poppers",
        description: "J",
        imagePath: "lib/images/sides/spicy_jelepeno_poppers.png",
        price: 9.99,
        category: FoodCategory.sides,
        availableAddons: [
          AddOn(name: "Extra Cheese", price: 0.99),
        ]),
    //salads

        Food(
        name: "Russian Salad",
        description:
            "A creamy mix of boiled potatoes, peas, carrots, and mayo, blended with bits of chicken and egg for a rich, traditional flavor.",
        imagePath: "lib/images/salads/russian_salad.png",
        price: 4.99,
        category: FoodCategory.salads,
        availableAddons: [
          AddOn(name: "Extra tomatoo", price: 0.99),
        ]),
    Food(
        name: "Classic Caesar Salad",
        description:
            "Fresh romaine tossed with parmesan, croutons, and creamy Caesar dressing — simple, crunchy, and satisfying.",
        imagePath: "lib/images/salads/classic_ceaser_salad.png",
        price: 4.99,
        category: FoodCategory.salads,
        availableAddons: [
          AddOn(name: "Extra tomatoo", price: 0.99),
        ]),
    Food(
        name: "Greek Feta Salad",
        description:
            "A Mediterranean favorite with juicy tomatoes, cucumbers, olives, onions, and feta cheese dressed in olive oil.",
        imagePath: "lib/images/salads/greek_fata_salad.png",
        price: 4.99,
        category: FoodCategory.salads,
        availableAddons: [
          AddOn(name: "Extra tomatoo", price: 0.99),
        ]),
    Food(
        name: "Crunchy Coleslaw",
        description:
            "Shredded cabbage and carrots mixed in a tangy, creamy slaw dressing — perfect as a cool, crunchy side.",
        imagePath: "lib/images/salads/crunchy_coleslaw.png",
        price: 4.99,
        category: FoodCategory.salads,
        availableAddons: [
          AddOn(name: "Extra tomatoo", price: 0.99),
        ]),
    Food(
        name: "Chicken Pasta Salad",
        description:
            "Grilled chicken, pasta, cherry tomatoes, and bell peppers tossed in a zesty herb dressing — hearty and refreshing.",
        imagePath: "lib/images/salads/chicken_pasta_salad.png",
        price: 4.99,
        category: FoodCategory.salads,
        availableAddons: [
          AddOn(name: "Extra tomatoo", price: 0.99),
        ]),
        

    // drinks
      Food(
        name: "Classic Cola Chill", 
        description: "Ice-cold fizzy cola served with lemon and crushed ice — the all-time favorite refresher.", 
        imagePath: "lib/images/drinks/classic_cola_chill.jpg", 
        price: 4.99, 
        category: FoodCategory.drinks, 
        availableAddons: [
          AddOn(name: "Extra Lemon", price: 1.50)]
        ),
        Food(
        name: "Minty Lemon Splash", 
        description: "A zesty blend of lemon juice, fresh mint leaves, and chilled soda water — perfect for beating the heat.", 
        imagePath: "lib/images/drinks/minty_lemon_splash.jpg", 
        price: 4.99, 
        category: FoodCategory.drinks, 
        availableAddons: [
          AddOn(name: "Extra Lemon", price: 0.99)]
        ),
        Food(
        name: "Mango Tango Cooler", 
        description: "Smooth mango nectar blended with ice and a hint of citrus — tropical vibes in every sip.", 
        imagePath: "lib/images/drinks/mango_tango_cooler.jpg", 
        price: 4.99, 
        category: FoodCategory.drinks, 
        availableAddons: [
          AddOn(name: "Extra Lemon", price: 0.99)]
        ),
        Food(
        name: "Strawberry Cream Fizz", 
        description: "Sweet strawberries whipped into a creamy soda mix — light, fizzy, and totally refreshing.", 
        imagePath: "lib/images/drinks/strawberry_cream_fizz.jpg", 
        price: 4.99, 
        category: FoodCategory.drinks, 
        availableAddons: [
          AddOn(name: "Extra Lemon",   price: 0.99)]
        ),
        Food(
        name: "Iced Mocha Bliss", 
        description: "A chilled coffee drink with rich chocolate, cold milk, and ice — bold, energizing, and smooth.", 
        imagePath: "lib/images/drinks/iced _mocha_bliss.jpg", 
        price: 4.99, 
        category: FoodCategory.drinks, 
        availableAddons: [
          AddOn(name: "Extra Lemon",price: 0.99)]
        ),
        

    //desserts 

    Food(
        name: "Chocolate Lava Cake", 
        description: "A warm, rich chocolate cake with a gooey molten center — served fresh and oozing with delight.", 
        imagePath: "lib/images/desserts/chocolate_lava_cake.jpg", 
        price: 7.99, 
        category: FoodCategory.deserts, 
        availableAddons: [
          AddOn(name: "Extra Chocolate",price: 1.49)]
        ),
        Food(
        name: "Vanilla Dream Sundae", 
        description: "Classic vanilla ice cream topped with whipped cream, chocolate syrup, and crunchy caramel bits.", 
        imagePath: "lib/images/desserts/vanilla_dream_sundae.jpg", 
        price: 4.99, 
        category: FoodCategory.deserts, 
        availableAddons: [
          AddOn(name: "Extra ",  price: 1.49)]
        ),
        Food(
        name: "Strawberry Cheesecake Slice", 
        description: "Smooth, creamy cheesecake with a buttery base and a thick layer of fresh strawberry glaze.", 
        imagePath: "lib/images/desserts/strawberry_cheesecake_slice.jpg", 
        price: 4.99, 
        category: FoodCategory.deserts, 
        availableAddons: [
          AddOn(name: "Extra ", price: 1.49)]
        ),
        Food(
        name: "Caramel Fudge Brownie", 
        description: "A dense chocolate brownie drizzled with golden caramel and sprinkled with fudge chunks.", 
        imagePath: "lib/images/desserts/caramel_fudge_brownie.jpg", 
        price: 4.99, 
        category: FoodCategory.deserts, 
        availableAddons: [
          AddOn(name: "Extra ",price: 1.49)]
        ),
        Food(
        name: "Mini Donut Bites", 
        description: "Soft and fluffy mini donuts coated in cinnamon sugar — bite-sized, warm, and addictive.", 
        imagePath: "lib/images/desserts/mini_donut_bites.jpg", 
        price: 4.99, 
        category: FoodCategory.deserts, 
        availableAddons: [
          AddOn(name: "Extra ",price: 1.49)]
        ),     

  ];   // -- menu

  /*

      GETTERS 

  */

    List<Food> get menu=>_menu;
    List<CartItem> get cart=>_cart;

    // Cart 
    final List<CartItem> _cart=[];

     String _deliveryAddress="6901 hollywood Blv";

    /*

      Operations

    */
    //update Delivery Address 
    updateDeliveryAddress(String newAdress){
      _deliveryAddress=newAdress;
      notifyListeners();
    }

    String get deilveryAddress=>_deliveryAddress;

    // add to cart 
    void addToCart(Food food, List<AddOn> selectedAddOn){
      // see if there is a cart item in the list already with the same food and addons  
      CartItem? cartItem=_cart.firstWhereOrNull((item){
        // this method absically checks us all the items in the list , and will return the first one that matches our conditions other wise null 
          // check if the foods are the same 
          bool isSameFood=item.food==food;

          //check if the add ons are all same 
          bool isSameAddons=const ListEquality().equals(item.selectedAddOn, selectedAddOn);

          return isSameFood && isSameAddons;
      });

      //If item already exists , increase the quantity 

      if(cartItem!=null){
        cartItem.quantity++;
      }
      else{
        //otherwise we are just going to add a new Cart Item 
        _cart.add(CartItem(
          food: food, 
          selectedAddOn: selectedAddOn));
          
      }
      notifyListeners();
    }

    // remove from cart 
    void remmoverFromCart(CartItem cartItem){
      //get theh index of the cartItem 
      int itemIndex=_cart.indexOf(cartItem);
      if(itemIndex!=-1){
        if(_cart[itemIndex].quantity>1){
          //decrease the quantity
          cartItem.quantity--;
        }
        else{ // if it is 1 
          //remove item from the cart
          _cart.removeAt(itemIndex);
        }
      }
      notifyListeners();
    }

    // get total price of cart 
    double getTotalPrice(){
      //foro getting the total price , i'll try to use the fold() method ! 
      double totalPrice=0.0;
      // iterating throught each cart Item , adn getting the total price from each cart item and summing them , and giving it back ! 
      totalPrice=_cart.fold(0.0, (sum,item)=>sum+item.totalPrice); 
      //it will iterate throught each item , and sum their prices   
      return totalPrice;
    }

    // get the number of items in the cart 

    int getTotalItems(){
      return _cart.length;
    }

    //clear cart 
    void clearCart(){
      _cart.clear();
      notifyListeners();
    }

    /* 
    
        HELPERS 

    */

    // generate a reciept 

    String displayCartReciept(){
      // this is gonna be a very long reciept so we are going to use a StringBuffer 
      final reciept=StringBuffer();
      // as a little I know about this , we can write in this Strin 
      reciept.writeln("Here's your reciept !");
      reciept.writeln();
      //format the date to show till seconds only 
      String formattedDate=DateFormat("yyyy-mm--dd HH-MM-ss").format(DateTime.now());
      reciept.writeln(formattedDate);
      reciept.writeln();
      reciept.writeln("---------------");
      
      for(final cartItem in _cart){
        //print out ecah item 
        reciept.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
        );
        //print out all the Addons with their prices too 
        if(cartItem.selectedAddOn.isNotEmpty){
          reciept.writeln(
            "Addons : ${_formatAddons(cartItem.selectedAddOn)}"
          );
        }
        reciept.writeln();
       
      }
      reciept.writeln("------------");
      //show total items 
       reciept.writeln("Total Items : ${getTotalItems()}");
       reciept.writeln("Total Price :\$ ${_formatPrice(getTotalPrice())}");
       reciept.writeln("Delivery Address : $_deliveryAddress");

      return reciept.toString();
  
    }


    //format double value into money 
    String _formatPrice(double price){
      return "\$ ${price.toStringAsFixed(2)}"; // toStringAsFixed() is used to convert the double value into a string , and the 2 in the parameters define , how much numbers should be after the decimal part (it is a good practice to use this function)
    }

    //format list of add ons into a list summary ! 
     _formatAddons(List<AddOn> addons){
      // I need add ons name and pricess together 
      // use the map method , to make them into a string and return a list 
      return addons.map((addon){
        return "${addon.name} + ${_formatPrice(addon.price)} ,";
      }).toList();
    }


}