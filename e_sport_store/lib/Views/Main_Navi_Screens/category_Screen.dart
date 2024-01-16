import 'package:e_sport_store/Controllers/product_controller.dart';
import 'package:e_sport_store/Views/Main_Navi_Screens/CategoriesDetail_Screens/category_Details.dart';
//import 'package:e_sport_store/Views/Main_Navi_Screens/Categories_DetailScreens/category_Details.dart';
//import 'package:E_Store/Views/Main_Navi_Screens/Categories_Screens/category_Details.dart';
import 'package:e_sport_store/Widget-Custom/back_ground.dart';
import 'package:e_sport_store/consts/consts.dart';
import 'package:e_sport_store/consts/iconList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class catorgoryScreen extends StatelessWidget {
  const catorgoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =Get.put(productController());

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: topCategory.text.fontFamily(bold).make(),
        ),
        body: Container(
          padding:EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200), 
          itemBuilder: (context, index){
            return Column(
              children: [
                Image.asset(CategoryImages[index] , height: 120),
                10.heightBox,
                categoryList[index].text.color(Colors.red).make()
              ],
            ).box.white.clip(Clip.antiAlias).make().onTap(() {
              controller.getSubCategories(categoryList[index]);
              Get.to(()=>categoryDetails(title: categoryList[index]));
            });
          
          }),
        ),
      
      ));
  }
}