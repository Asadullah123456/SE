// ignore: duplicate_ignore
// ignore_for_file: unnecessary_import, avoid_web_libraries_in_flutter, unused_import

import 'package:e_sport_store/Controllers/auth_controllers.dart';
import 'package:e_sport_store/Views/Home/Home.dart';
import 'package:e_sport_store/Widget-Custom/Text-field.dart';
import 'package:e_sport_store/Widget-Custom/app-Logo.dart';
import 'package:e_sport_store/Widget-Custom/back_ground.dart';
import 'package:e_sport_store/Widget-Custom/button-All.dart';
import 'package:e_sport_store/consts/consts.dart';
// ignore: unused_import
import 'package:e_sport_store/consts/iconList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html';
import 'package:velocity_x/velocity_x.dart';


class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
bool? isCheck =false;
//for fire base controller
var controller=Get.put(AuthController());
//text controllers 
var nameController=TextEditingController();
var emailController=TextEditingController();
var passwordController=TextEditingController();
var passwordRetypeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (context.screenHeight *0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Join Us $appname" .text.fontFamily(bold).white.size(18).make(),
              10.heightBox,
                
              Obx(
                () => Column(

                    children: [
                    customTextField(hint: nameHint ,title: name, controller: nameController,isPass: false ),
                    customTextField(hint: emailHint ,title: email, controller: emailController, isPass: false ),
                    customTextField(hint: passwordHint, title: password, controller: passwordController, isPass: true),
                     customTextField(hint: passwordHint, title: retypePassword, controller: passwordRetypeController, isPass: true),
                    Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: forgetPass.text.black.make())),
                    5.heightBox,
                  
                           
                   Row(
                    children: [
                      
                      Checkbox(checkColor: Colors.black54    , value: isCheck, 
                      onChanged: (newValue){setState(() {isCheck=newValue;});}
                      ),
              
                    10.heightBox,
                    Text(policy).color(lightGrey),
              
                    ],
                   ),
                    //SignupButton
                    controller.isLoading.value? 
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ):buttonAll(
                    color: isCheck==true ? redColor : lightGrey ,
                    title: signUp, textColor: whiteColor, 
                    onPress: () async {

                    if (isCheck != false) {
                      controller.isLoading(true);
                      try{
                     await controller.signupMethod(
                      context: context,email :emailController.text, password:passwordController.text).then((value) 
                      {
                        return controller.storeUserData(
                          
                          email:emailController.text,
                          password: passwordController.text,
                          name: nameController.text
                        );
                      }).then((value){
                       VxToast.show(context, msg: loggedin);
                        Get.offAll(()=> const Home());
                      });
                      }
                      catch(e){
                        auth.signOut();
                        VxToast.show(context, msg: e.toString());
                        controller.isLoading(false);
                      }
                     }
                    },
                    ).box.width(context.screenWidth -50).make(),//box.width(context.screenWidth -50).make(),
                    40.heightBox,
              
                    Row(
                      children: [
                        Text(alreadyAccount).color(fontGrey),
                        5.widthBox,
                        Text(login).color(redColor).onTap((){
                        Get.back();
                        }),
                      ],
                    ),
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.width-70).make(),
              )
            
              
            ],
          ),
        ),
      )
    );
  }
}