import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_sport_store/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
var isLoading=false.obs;
//text controller
var emailController=TextEditingController();
var passwordController=TextEditingController();

//login 
Future<UserCredential?> loginMethod({context}) async{
  UserCredential? userCredential;

  try{
    userCredential =await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
  } on FirebaseAuthException catch (e) {
    VxToast.show(context, msg: e.toString());
  } 
  return userCredential;
}

//signup
Future<UserCredential?> signupMethod({email, password, context}) async{
  UserCredential? userCredential;

  try{
    userCredential =await auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    VxToast.show(context, msg: e.toString());
  } 
  return userCredential;
}
//strore user data 
 storeUserData({name,password, email}) async{
  DocumentReference Store= firestore.collection(UserCollection).doc(currentUser! .uid);
  Store.set({'name' : name, 
  'password': password, 
  'email':email, 
  'imageUrl':'', 
  'id':currentUser!.uid,
   'cart_count':"00",
   'order_count':"00",
   'wishlist_count':"00",
  });

 }

 //signout
 signoutMethod(context) async {
  try{
    await auth.signOut();
  }
  catch(e){
    VxToast.show(context, msg: e.toString());
  }
 }

}