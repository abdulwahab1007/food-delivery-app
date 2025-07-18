import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  // storing the order , deleting the order 
  //get he collection refernece of orders 
  final CollectionReference orders=FirebaseFirestore.instance.collection("orders");

  // i can put it all in a single method too 
  Future<void> addOrderToDatabase(String reciept)async{
    await orders.add({
      "date" : DateTime.now(),
      "order": reciept
      // add more firleds as nessessary .....
    }
    );
  }
  
}