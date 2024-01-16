import 'dart:html';

import 'package:e_sport_store/Views/Auth-Screen/Sign-Up.dart';
import 'package:e_sport_store/Views/Home/Home.dart';
import 'package:e_sport_store/Widget-Custom/Text-field.dart';
import 'package:e_sport_store/Widget-Custom/app-Logo.dart';
import 'package:e_sport_store/Widget-Custom/back_ground.dart';
import 'package:e_sport_store/Widget-Custom/button-All.dart';
import 'package:e_sport_store/consts/consts.dart';
import 'package:e_sport_store/consts/iconList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_sport_store/Controllers/auth_controllers.dart';



class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(AuthController());
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (context.screenHeight *0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Log in to $appname" .text.fontFamily(bold).white.size(18).make(),
              10.heightBox,
                
              Obx(
                () => Column(
                  children: [
                    customTextField(hint: emailHint ,title: email, isPass: false, controller:controller.emailController ),
                    customTextField(hint: passwordHint, title: password, isPass: true, controller: controller.passwordController),
                    Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: forgetPass.text.black.make())),
                    5.heightBox,
                    
                    //loginButton
                   controller.isLoading.value ? 
                   const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                   )
                   
                   : buttonAll(color: redColor,title: login, textColor: whiteColor, 
                    onPress:  () async {
                     controller.isLoading(true);

                      await controller.loginMethod(context: context).then((value){
                        if(value !=null){
                      VxToast.show(context, msg: loggedin);
                      Get.offAll(()=>const Home());
                        }
                        else{
                          controller.isLoading(false);
                        }

                      });
                    }).box.width(context.screenWidth-50).make(),
                    40.heightBox,
                    //text data below LoginButton
                    createNewAccount.text.color(fontGrey).make(),
                    10.heightBox,
                    //SignUpButton
                     buttonAll(color: redColor,title: signUp, textColor: whiteColor, onPress: (){Get.to(()=>const signupScreen());}).box.width(context.screenWidth-30).make(),
                     
                      40.heightBox,
                      //LoginWith Text
                      loginWith.text.color(const Color.fromARGB(255, 0, 0, 0)).bold.make(),
              
                      5.heightBox,
                      //icons
                      Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: List.generate(3, (index) => Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: CircleAvatar(
                          child: Image.asset(SocialAppIcon[index]),
                           backgroundColor: lightGrey,
                         ),
                       )),
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