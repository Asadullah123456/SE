import 'package:e_sport_store/Views/Home/Feature_Componenet.dart';
import 'package:e_sport_store/Widget-Custom/home_ScreenButtons.dart';
import 'package:e_sport_store/consts/consts.dart';
import 'package:e_sport_store/consts/iconList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                   fillColor: whiteColor,
                   hintText: searchAnything,
                   hintStyle: TextStyle(color: textfieldGrey),

                ),
              ),
            ),
          
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                           // 1#Swiperrrr for Brands
                    
                    VxSwiper.builder(
              aspectRatio: 16/9,
              autoPlay: true,
              height: 150,
              itemCount: slidersList.length, 
              itemBuilder: (context, index) {
              return Container(
                child: Image.asset(
                  slidersList[index],
                  fit: BoxFit.fitWidth,
                ),
              );
                    }
                    ),
                    10.heightBox,
                    Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(2, (index) => homeButtons(
              height:context.screenHeight * 0.10,
              width :context.screenWidth/4,
              icon  :index==0 ? icTodaysDeal :icFlashDeal,
              title :index==0 ? todayDeal : flashSale
                    )),
                    ),
                    10.heightBox,
            
                    //2# Swiperr 
                    VxSwiper.builder(
              aspectRatio: 16/8,
              autoPlay: true,
              height: 150,
              itemCount: SslidersList.length, 
              itemBuilder: (context, index) {
              return Container(
                child: Image.asset(
                  SslidersList[index],
                  fit: BoxFit.fitWidth,
                ),
              );
                    }
                    ),
                     5.heightBox,
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) => homeButtons(
              height:context.screenHeight * 0.10,
              width :context.screenWidth/4,
              icon  :index==0 
              ? icTopCategories 
              :index ==1 
              ? icBrands 
              : icTopSeller,
              title :index==0 
              ? topCategory 
              :index ==1
              ? brands
              :topSellers,
                    )),
                    ),
                    5.heightBox,
                    Align(
              alignment: Alignment.centerLeft,
              child: featureCategories.text.color(darkFontGrey).size(15).fontFamily(bold).make(),
                    ),
                   20.heightBox,
                   Row(
                    children: List.generate(3, (index) => Column(
                      children: [
                        featureButton(icon: featureImages1[index], title: featureTitles1[index]),
                        10.heightBox,
                         featureButton(icon: featureImages2[index], title: featureTitles2[index]),
                      ],)).toList(),
                   ),
                 20.heightBox,
                 Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.cyan),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    featureProduct.text.black.fontFamily(bold).make(),
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

                ],
              ),
            ),
          ),

          ],
        )
      ),

    );
  }
}