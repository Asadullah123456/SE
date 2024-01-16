import 'package:e_sport_store/Models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class productController extends GetxController {
  var subcat=[];

  var quantity =0.obs;
  var colorIndex=0.obs;
  var totalPrice=0.obs;

 getSubCategories(title) async{
  //subcat.clear();
  var data = await rootBundle.loadString("lib/Services/category_model.json");
  var decoded = categoryModelFromJson(data);
  var s = decoded.categories.where((element)=> element.name == title).toList();
  
  for (var e in s[0].subcategory){
    subcat.add(e);
  }

 }

 //change color or slectr item
 changeColorIndex(index){
 colorIndex=index;
 }

 increaseQuantity(totalQuatity){
  if(quantity.value<totalQuatity){
quantity.value++;
  }
  
  
 }
  decreaseQuantity(){
  if(quantity.value>0){
  quantity.value--;
  }
 }

   calculateTotalPrice(price){
    totalPrice.value=price*quantity.value;
  }



}