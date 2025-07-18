import 'package:flutter/material.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap
    });

  final IconData icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const  EdgeInsets.only(left: 20.0),
      child: ListTile(
        onTap: onTap,
        iconColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Icon(icon),
        title: Text(text,
        style: myInversePrimaryTextStyle(
          context: context,
          fontSize: 18
          ),),
      ),
    );
  }
}