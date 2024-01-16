//import 'dart:html';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_sport_store/Controllers/profile_controller.dart';
import 'package:e_sport_store/Widget-Custom/Text-field.dart';
import 'package:e_sport_store/Widget-Custom/back_ground.dart';
import 'package:e_sport_store/Widget-Custom/button-All.dart';
import 'package:e_sport_store/consts/consts.dart';
import 'package:e_sport_store/consts/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  
  //const EditProfileScreen( QueryDocumentSnapshot<Object?> data, {super.key,});
  const EditProfileScreen({Key? key, this.data}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  //profile change controller
 var controller =Get.find<ProfileController>(); 

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          ()=> Column(
            mainAxisSize: MainAxisSize.min,
           children: [
        
        //if data image url & controller path is empty
      data['imageUrl']=='' && controller.ProfileImagePath.isEmpty 
             ? Image.asset(imgProfile2,width: 90,fit: BoxFit.cover)
           .box.roundedFull.clip(Clip.antiAlias).make() 

           :data['imageUrl'] !='' && controller.ProfileImagePath.isEmpty
            ?Image.network(data['imageUrl'],width: 100,
            fit:BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make() 
            :Image.file(
            File(controller.ProfileImagePath.value),
            width: 100,
            fit:BoxFit.cover,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
           buttonAll(color: redColor,onPress: (){
           controller.changeImage(context);
           },textColor:whiteColor, title: "Change"),
              Divider(),      
            10.heightBox,
              customTextField(controller: controller.nameController,hint: nameHint, title: name, isPass:false),
            10.heightBox,
              customTextField(controller: controller.oldpassController ,hint: passwordHint, title: oldpass, isPass:true),
    
              10.heightBox,
              customTextField(controller: controller.newpassController ,hint: passwordHint, title: newpass, isPass:true),
             
             controller.isLoading.value ? CircularProgressIndicator(
               valueColor: AlwaysStoppedAnimation(redColor),
               )
               :SizedBox(
                width: context.screenWidth-30,
                child: buttonAll(color: redColor,
                onPress: () async  {
                  controller.isLoading(true);
                 //when iamge not select
                  if(controller.ProfileImagePath.value.isNotEmpty){
                  await controller.uploadProfileImage();
                  }
                  else{
                    controller.profileImageLink= data['imageUrl'];
                  }
                 //passwordMatching
                 if(data['password']== controller.oldpassController.text){
                   await controller.changeAuthPassword(
                   email: data['email'],
                   password: controller.oldpassController.text,

                   newpassword: controller.newpassController.text

                   );
                   
                   await controller.updateProfile(
                    imgUrl: controller.profileImageLink,
                    name: controller.nameController.text,
                    password: controller.newpassController.text
                     );
                  VxToast.show(context, msg: "Update");
                 }
                 else{
                  VxToast.show(context, msg: "Wrong Password");
                  controller.isLoading(false);
                 }



                 
                  
                 
                },textColor:whiteColor, title: "Save")),
           ],
          ).box.white.shadowSm.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top:50,left: 15, right: 15)).rounded.make(),
        ),
        
      )
    );
  }
}