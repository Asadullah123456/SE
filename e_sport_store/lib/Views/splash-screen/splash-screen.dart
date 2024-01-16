import 'package:e_sport_store/Views/Auth-Screen/Login-Screen.dart';
import 'package:e_sport_store/Views/Home/Home.dart';
import 'package:e_sport_store/Widget-Custom/app-Logo.dart';
import 'package:e_sport_store/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}


class _splashScreenState extends State<splashScreen> {

//this method for screen changing
changeScreen(){
Future.delayed(Duration(seconds: 3), (){
  //with help of GetX
   // Get.to(()=> const loginScreen());
  //for stay login to home screen
  auth.authStateChanges().listen((User ? user) { 
    if(user == null && mounted){
      Get.to(()=>const loginScreen());
    }
    else{
      Get.to(()=>const Home());
    }
  });

});
}
@override
void initState(){
  changeScreen();
  super.initState();
}



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
             Align(alignment: Alignment.topLeft,child: Image.asset(icSplashBg, width: 300)),
              20.heightBox,
              appLogoWidget(),
              10.heightBox,
              appname.text.fontFamily(bold).size(22).white.make(),
              Spacer(),
              credits.text.white.fontFamily(bold).make(),
              30.heightBox,
            
          ],
        ),
      ),
    );

  }
}