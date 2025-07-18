import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/food_tile.dart';
import 'package:food_delivery_app/components/my_current_location.dart';
import 'package:food_delivery_app/components/my_description_box.dart';
import 'package:food_delivery_app/components/my_drawer.dart';
import 'package:food_delivery_app/components/my_sliver_app_bar.dart';
import 'package:food_delivery_app/components/my_tab_bar.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurent.dart';
import 'package:food_delivery_app/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController _tabController;  //initlaize it in the initState

  //filter menu by category 
  // full menu is containing the objects of Food
  List<Food> _filterMenuByCategory(FoodCategory category,List<Food> fullMenu){
    return fullMenu.where((food)=>food.category==category).toList(); 
    // return the list for different categories  
  }

  // return the list of fooods in this category

  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category){
      //category Menu
      final categoryMenu=_filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        padding: const EdgeInsets.only(left: 0,top: 10.0,right: 0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categoryMenu.length, 
        itemBuilder: (context,index){
          //  get an individual food
          final food=categoryMenu[index];
          return  FoodTile( 
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> FoodPage(food: food,),
                ));
            },  // navigate to the food page 
              food: food, 
          );
        }
        );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _tabController=TabController(
      length: FoodCategory.values.length, 
      vsync: this
      );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer:   MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context,innerBoxIsScalled)=>[
             MySliverAppBar(
            title: MyTabBar(
              tabController: _tabController
              
              ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(indent: 25.0,endIndent: 25.0,
                color: Theme.of(context).colorScheme.tertiary,
                thickness: 2.0,),
                const SizedBox(height: 20.0,),
                //  current location 

                 const MyCurrentLocation(),

                const MyDescriptionBox(),
                const SizedBox(height: 40.0,)

                // delivery time 
              ],
            ),
          )
        ], 
        body:  Consumer<Restaurent>(
          builder: (context,restaurent,chlid){
            return TabBarView( // So in the Tab Bar View , we define the three widgets for each of the three(or more) tabs 
          controller: _tabController,
          
        children: getFoodInThisCategory(restaurent.menu)
           );
          }
          )

        ),
    );
  }
}