import 'package:e_sport_store/Views/Main_Navi_Screens/CategoriesDetail_Screens/category_Details.dart';
import 'package:e_sport_store/consts/consts.dart';
import 'package:e_sport_store/consts/fireBase_Const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore firestore=FirebaseFirestore.instance;
// ignore: camel_case_types
class firestoreServices {
  
  //get Users Data

  static getUser(uid){

    return firestore.collection("users").where('id', isEqualTo: uid).snapshots();
  } 

  static getProducts(category){
    return firestore.collection("products").where('p_category',isEqualTo:category).snapshots();
  }

}