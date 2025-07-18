import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/drawer_tile.dart';
import 'package:food_delivery_app/pages/settings_page.dart';
import 'package:food_delivery_app/services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget{
   MyDrawer({super.key});

  final authServices =AuthServices();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          DrawerHeader(
            decoration: const BoxDecoration(

            ),
            child: Icon(Icons.lock_open_outlined,
          color: Theme.of(context).colorScheme.inversePrimary,
          size: 70,
          )),
          
          const SizedBox(height: 30.0,),
          //home Tile 
          DrawerTile(
            icon: Icons.home_outlined, 
            text: "H O M E", 
            onTap: (){
              Navigator.pop(context);
            }
            ),
             DrawerTile(
            icon: Icons.settings_outlined, 
            text: "S E T T I N G S ", 
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>const SettingsPage()
                ));
            }
            ),

            const Spacer(),   // It will just   fill out all of the space between widgets --> we cannot fill out the any space in this spacer area now 
             Padding(
              padding: const EdgeInsets.only(bottom: 10.0,left: 5.0),
               child: DrawerTile(
                 icon: Icons.logout_outlined, 
                 text: "L O G O U T", 
                 onTap: ()async=>await authServices.signout()
                ),
             )


          

        ],
      ),
    );
  }
}