import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/helper/helper_functions.dart';
import 'package:food_delivery_app/pages/delivery_progress_page.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  // we need some thigns here 
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  String cardNumber=''; 
  String expiryDate=''; 
  String cardHolderName=''; 
  String cvvCode=''; 
  bool isCvvFocused=false;
  //user wants to pay method 
  void userTappedPay(){
    //only allow the user to pay , when the card is valid 
    if(formKey.currentState!.validate()){
      //only show dialog if form is valid 
      showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
          contentTextStyle: myPrimaryTextStyle(context: context),
          title: Center(child: Text("Confirm Payment",
          style: myInversePrimaryTextStyle(
            context: context,
            fontSize: 20,
            fontWeight: FontWeight.w400
            ),),),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Card Number : $cardNumber"),
                  Text("Expiry date : $expiryDate"),
                  Text("Card Holder Name : $cardHolderName"),
                  Text("CVV Code : $cvvCode"),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text("Cancel")
                ),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  //navigate to the deliveryProgreePage
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>const DeliveryProgressPage()));
                }, 
                child: const Text("Yes")
                ),
            ],
        )
        );
    }
  } 
  
  @override
  Widget build(BuildContext context) {
    bool isDarkMode= Provider.of<ThemeProvider>(context,listen: false).isDarkMode;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Checkout"),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        children: [
         CreditCardWidget(
                  cardNumber: cardNumber, 
                  expiryDate: expiryDate, 
                  cardHolderName: cardHolderName, 
                  cvvCode: cvvCode, 
                  showBackView:  isCvvFocused,
                  onCreditCardWidgetChange: (p0){}
                  ),
                  //credit Card Form 
                  CreditCardForm(
                    cardNumber: cardNumber, 
                    expiryDate: expiryDate, 
                    cardHolderName: cardHolderName, 
                    cvvCode: cvvCode, 
                    onCreditCardModelChange: (data){
                      // now by doing this , what we will write on form , will be wriitne on the card too 
                      setState(() {
                        cardNumber=data.cardNumber;
                        expiryDate=data.expiryDate;
                        cardHolderName=data.cardHolderName;
                        cvvCode=data.cvvCode;
                      });
                    }, 
                    formKey: formKey,
                    ),
                    
                      
                    const Spacer(),
                      
                    Padding(
                      padding: const  EdgeInsets.only(right: 20.0,left: 20.0,bottom: 20.0),
                      child: MyButton(
                        text: "Pay Now", 
                        onTap: userTappedPay, // Navigate to the delivery Progress Page 
                        colors: isDarkMode ?[
                          const Color(0xFF232526) , const Color(0xFF414345)
                      ]:[const Color(0xFFFFFFFF), const Color(0xFFCCCCCC),]
                        ),
                    ),
        ],
      ),
    );
    
  }
}