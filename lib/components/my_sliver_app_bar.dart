import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/cart_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title
    });

  final Widget child;
  final Widget title;


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 360,
      collapsedHeight: 120,
      backgroundColor: Theme.of(context).colorScheme.background,
      floating: false,
      pinned: true,
      title: Text("Sunset Diner",
      style: GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.inversePrimary
      ),),
      centerTitle: true,
      actions: [
        // cart button  
        IconButton(
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=> const CartPage())
              );
          }, 
          icon: Icon(Icons.shopping_cart_outlined,
          color: Theme.of(context).colorScheme.inversePrimary,)
          ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: title,
        centerTitle: true,
        expandedTitleScale: 1,
        titlePadding: const EdgeInsets.only(left: 0,right: 0,top: 0),
      ),
    );
  }
}