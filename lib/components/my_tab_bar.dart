import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class MyTabBar extends StatelessWidget{
  const MyTabBar({
    super.key,
    required this.tabController
    });

  // Tab  controller 
  final TabController tabController;

  // create the list of the tab Bars according to the food categories 

  List<Tab> _buildCategoryTabs(){
    return FoodCategory.values.map((category){
      return Tab(
        text: category.name.toString().split('.').last,
      );
    }).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      child:  TabBar(        
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Theme.of(context).colorScheme.inversePrimary,
        indicatorWeight: 2,
        tabs:_buildCategoryTabs(),
        ),
    );
  }
}