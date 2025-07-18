class Food {
  //so think of a food 
  final String name; // Cheese burger
  final String description;  // a nice fuckin Cheese burger
  final String imagePath; // lib/images/blahblah.png
  final double price ; // 0.99 fuckin dollars 
  final FoodCategory category;  // here us can use FoodCategory.burgers 
  List<AddOn> availableAddons; // Extra Cheese, or jelepenoes 

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons
  });
  
}

//Food Categories -->
/*
   Now only these five options (burgers, salads, sides, deserts, drinks) are valid for anything that expects a FoodCategory.
*/
enum FoodCategory{
  burgers,
  salads,
  sides,
  deserts,
  drinks
}

class AddOn{  // Add On s like extra cheese , extra jalpenos 
  final String name;
  final double price;

  AddOn({
    required this.name,
    required this.price
  });
}