import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_reciept.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';
import 'package:food_delivery_app/models/restaurent.dart';
import 'package:food_delivery_app/services/database/firestore_database.dart';
import 'package:provider/provider.dart';
 
class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

    FirestoreDatabase firestoreService=FirestoreDatabase();

  @override
  void initState()  {
    //so when the user comes to this page , store the order reciept to the database , so the shef can see it 
  
    String reciept=context.read<Restaurent>().displayCartReciept();
      firestoreService.addOrderToDatabase(reciept); 
     super.initState();    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("Delivery Page",),
      ),
      body:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MyReciept(),
            const SizedBox(height: 20.0,),
        
            Text("Estimated Delivery time is 20 mins.",
            style: myInversePrimaryTextStyle(context: context))
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  _buildBottomNavigationBar(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 90,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(35.0),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.person)
              ),
          ),
          const SizedBox(width: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Abdul Wahab",
            style: myInversePrimaryTextStyle(
              context: context,
              fontSize: 18),),
              Text("Driver",
              style: myPrimaryTextStyle(context: context),)
              ],
            ),
            const Spacer(),

            //message Icon Button 
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle
              ),
              child: IconButton(onPressed: (){}, icon:  Icon(Icons.message,color: Theme.of(context).colorScheme.primary,))),

            //call icon button 
            const SizedBox(width: 5.0,),

            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.background
              ),
              child: IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.call,
                color: Colors.green,)
                ),
            )
        ],
      ),
    );
  }
}