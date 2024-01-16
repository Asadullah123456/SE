import 'package:e_sport_store/Controllers/Home_ScreenControl.dart';
import 'package:e_sport_store/Views/Main_Navi_Screens/cart_Screen.dart';
import 'package:e_sport_store/Views/Main_Navi_Screens/category_Screen.dart';
import 'package:e_sport_store/Views/Main_Navi_Screens/home_Screen.dart';
import 'package:e_sport_store/Views/Main_Navi_Screens/profile.dart';
import 'package:e_sport_store/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//class HomeScreen extends StatelessWidget { We Can change this because it is use many times as Home
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
//homeScreen ControllerCall
   var controller=Get.put(HomeController());
   
    var NavbarItem =[
    
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26), label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26), label:categories),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26), label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26), label: account),
    ];
   var navBody=[
   const homeScreen(),
   const catorgoryScreen(),
   const cartScreen(),
   const profileScreen(),

  //  Container(color: Colors.amber),
  //   Container(color: const Color.fromARGB(255, 7, 164, 255)),
  //    Container(color: const Color.fromARGB(255, 255, 106, 7)),
  //     Container(color: const Color.fromARGB(255, 32, 7, 255)),
   ];


    return Scaffold(
      body: Column(
         children: [
          Obx(() =>  Expanded(child:navBody.elementAt(controller.currentNavIndex.value))),
         ],
    ),
      bottomNavigationBar: Obx(()=>
         BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: NavbarItem,
          onTap: (Value){
            controller.currentNavIndex.value=Value;
          },
        ),
      ),
    );
  }
}