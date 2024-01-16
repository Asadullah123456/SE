import 'package:e_sport_store/Controllers/product_controller.dart';
import 'package:e_sport_store/Widget-Custom/button-All.dart';
import 'package:e_sport_store/consts/consts.dart';
import 'package:e_sport_store/consts/iconList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class itemDetail extends StatelessWidget {
//
final String ? title;
final dynamic data;

  const itemDetail({key  , required this.title, this.data}) : super(key : key);

  @override
  Widget build(BuildContext context) {

   var controller=Get.find<productController>();

    print(Color.fromARGB(255, 180, 232, 24).value);
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
           IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body:Column(
        children: [
          Expanded(
            child: Padding
          (padding: const EdgeInsets.all(8),
          child:SingleChildScrollView(
            child: Column(
              children: [
                VxSwiper.builder(
                  
                   autoPlay:true,
                  itemCount :data['p_imgs'].length,
                  height: 350,
                  aspectRatio: 16/9,
                  itemBuilder: (context,index){
                 

                  return  Image.network(
                    data['p_imgs'][index],
                    //imgFc5,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
                ///
                10.heightBox,
                title!.text.size (16).make(),
                10.heightBox,
                VxRating(
                  isSelectable: false,
                  value: double.parse(data['p_rating']),
                onRatingUpdate:(Value){},
                selectionColor: golden,
                count: 5,
                size: 25,
                //stepInt: true,
                maxRating: 5,
                ),
                10.heightBox,
                "${data['p_price']}".text.color(redColor).fontFamily(bold).size(14).make(),

                10.heightBox,
                Row(
                  children: [
                    Expanded(child: Column(
                      children: [
                          "seller".text.white.fontFamily(semibold).make(),
                          5.heightBox,
                         "${data['p_seller']}".text.fontFamily(semibold).color(textfieldGrey).make(),

                      ],
                    )),
                    const CircleAvatar(
                      backgroundColor: Colors.white10,
                      child: Icon(Icons.message_rounded,color: darkFontGrey),
                    ),
                  ],
                ).box.height(60).color(redColor).make(),
                //color Section
                20.heightBox,
                
                Obx(
                   ()=> Column(
                    children: [
                      Row(
                      children: [
                        SizedBox(
                         width: 100,
                         child: "Color".text.color(Colors.black45).make(),
                        ),
                     Row(
                     children: List.generate(data['p_colors'].length, (index) => Stack(
                      alignment: Alignment.center,
                      children:[
                         VxBox()
                         .size(40,40).
                         roundedFull.color(Color((data['p_colors'][index])).withOpacity(1.0)).margin(const EdgeInsets.symmetric(horizontal: 6)).
                         make().onTap(() {
                          controller.changeColorIndex(index);
                          }),
                         Visibility(
                          visible: index==controller.colorIndex.value,
                          child: const Icon(Icons.done,color: Colors.white),), 
                         ],
                         // ignore: prefer_const_constructors
                         
                
                         )
                         ),
                
                
                     ),
                
                      ],).box.padding(const EdgeInsets.all(8)).make(),
                
                
                      //Qauanity Section
                       Row(
                      children: [
                        SizedBox(
                         width: 100,
                         child: "Quantity".text.color(Colors.black45).make(),
                        ),

                     Obx(
                      ()=> Row(
                                       children: [
                        IconButton(onPressed: (){controller.decreaseQuantity();
                                                controller.calculateTotalPrice((data['p_price'].toString()));
                        }, icon: Icon(Icons.remove)),
                       

                       controller.quantity.value.text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                        IconButton(onPressed: (){controller.increaseQuantity(double.parse(data['p_quantity']));
                                                 controller.calculateTotalPrice(double.parse(data['p_price'].toString())); 
                                                
                        }, icon: Icon(Icons.add)),
                        10.heightBox,
                       "(${data['p_quantity']} Availibale)".text.color(textfieldGrey).make(),
                                       ],
                                       ),
                     ),
                     
                     
                      ],).box.padding(const EdgeInsets.all(8)).make(), 
                     
                     /////////////////////////////
                      Row(
                      children: [
                        SizedBox(
                         width: 100,
                         child: "Total".text.color(Colors.black45).make(),
                        ),
                       "${controller.totalPrice.value}".numCurrency.text.color(redColor).size(16).fontFamily(bold).make(),
                      ],
                      ).box.padding(const EdgeInsets.all(8)).make(), 
                              
                              ],
                              ).box.make(),
                ),
          ////Description
        "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
        10.heightBox,
        "${data['p_desc']}".text.color(darkFontGrey).make(),
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(
              itemDetailButtonsList.length, 
              (index) => ListTile(
              title:itemDetailButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
              trailing: const Icon(Icons.arrow_forward),
              ),
              )
          ),
              /////Product likess
              20.heightBox,
              productYouMayLike.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
              10.heightBox,
               SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(6,(index) => Column(
                          children: [
                            Image.asset(imgPi1,width: 130,fit: BoxFit.cover),
                            10.heightBox, 
                            "Iphone-15 Pro ".text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,
                            "\$1200".text.color(Colors.red).fontFamily(bold).make(),

                          ],
                        ).marginAll(5).box.make()),
                      ),
                    ),

                    
              ],
            ),
        ),
          )),
          ///
          SizedBox(
            width: double.infinity,
            height: 60,
            child:  buttonAll(
              color : redColor,
              onPress :() { }, 
              textColor: whiteColor,
                title:"Add to Cart"),
          ),
        ],
      ),
    );
  }
}