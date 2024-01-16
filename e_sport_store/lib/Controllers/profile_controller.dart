// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_sport_store/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
//import 'package:firebase_storage/firebase_storage.dart';


class ProfileController extends GetxController{
  var ProfileImagePath=''.obs;
  var profileImageLink='';
  var isLoading=false.obs;

  //to get Text of EditProf Fields
  var nameController = TextEditingController();
   var oldpassController = TextEditingController();
   var newpassController = TextEditingController();

  changeImage(context) async {
  try {
     final img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (img == null) return;
    ProfileImagePath.value= img.path;
  }
   on PlatformException catch(e){
   VxToast.show(context, msg: e.toString());
  }

  }

 //forProfileUpload
 uploadProfileImage() async {
  var filename =basename(ProfileImagePath.value);
  var destination = 'image/${currentUser!. uid}/$filename';
  Reference ref = FirebaseStorage.instance.ref().child('destination');
  await ref.putFile(File(ProfileImagePath.value));
  profileImageLink= await ref.getDownloadURL();
}

updateProfile({name,password, imgUrl}) async{
  var store =firestore.collection(UserCollection).doc(currentUser!.uid);
 await store.set({'name':name, 'password':password,'imageUrl':imgUrl}, SetOptions(merge: true));
 isLoading(false);
}

changeAuthPassword({email,password,newpassword}) async{
  final cred = EmailAuthProvider.credential(email: email, password: password);
   
   await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newpassword);
   }).catchError((error){
   print(error.toSigned());
   });
}




}