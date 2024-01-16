import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_sport_store/Controllers/product_controller.dart';
import 'package:e_sport_store/Services/firestore_services.dart';
import 'package:e_sport_store/Views/Main_Navi_Screens/CategoriesDetail_Screens/item_Detail.dart';
import 'package:e_sport_store/Widget-Custom/back_ground.dart';
import 'package:e_sport_store/Widget-Custom/loading_indicator.dart';
import 'package:e_sport_store/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class categoryDetails extends StatelessWidget {
//for title gettting
final String ?title;

  const categoryDetails({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    
   var controller =Get.find<productController>();

    return bgWidget(
     child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).make()
      ),
      body: StreamBuilder(
        stream:firestoreServices.getProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        
         if (!snapshot.hasData){
            
          return Center(   
           child: loadingIndicator(),
            
        );
        }
        else if(snapshot.data!.docs.isEmpty){
          return Center(
            child: "No prodcuts Found".text.color(darkFontGrey).make(),
          );
        }
        else{
          var data=snapshot.data!.docs;
          return Container(
        padding: EdgeInsets.all(12),
        child: Column( 
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(controller.subcat.length, (index) =>"${controller.subcat[index]}".text.fontFamily(semibold).makeCentered().box.white.
                size(150, 60).margin(const EdgeInsets.symmetric(horizontal: 4)).make())
              ),
            ),
          
      ///////////////
      20.heightBox,
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250) , 
          itemBuilder: (context, index){
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                data[index]['p_imgs'][0],
                //imgP5,
                height: 150,
                width: 150,
                fit:BoxFit.cover,
              ),
              //const Spacer(),
               "${data[index]['p_name']}".text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,
                            "${data[index]['p_price']}".numCurrencyWithLocale().text.color(Colors.red).fontFamily(bold).make(),
                 10.heightBox,
            ],
            )
            .box.margin(const EdgeInsets.symmetric(horizontal: 4))
            .make().onTap(() {
            Get.to(()=>itemDetail(title: "${data[index]['p_name']}",data: data[index],));
          });
          

          }))

          ],
        ),
      );
        }
        
      },
        
        
      ),
     ),
    );
  }
}
