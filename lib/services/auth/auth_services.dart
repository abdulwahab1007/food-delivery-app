import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  // get the Firebase Auth instance 
  final FirebaseAuth _auth=FirebaseAuth.instance;

  // get current user 

  User? getUser(){
    return FirebaseAuth.instance.currentUser;
  }

  // sign in method 
  Future<UserCredential> signInWithEmailAndPassword(String email,String password)async{
    try{
      UserCredential userCredential=await _auth.signInWithEmailAndPassword(
      email: email, 
      password: password
      );
      return userCredential;
    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  // register method 

  Future<UserCredential> createUserWithEmailAndPassword(String email,String password)async{ 
    try{
      UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: email, password: password);

    return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
    }
    


  // sign out method 
  Future<void> signout()async{
    return await _auth.signOut();
  }

}