import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_sport_store/Controllers/auth_controllers.dart';
import 'package:e_sport_store/Controllers/profile_controller.dart';
import 'package:e_sport_store/Services/firestore_services.dart';
import 'package:e_sport_store/Views/Auth-Screen/Login-Screen.dart';
import 'package:e_sport_store/Views/Main_Navi_Screens/CategoriesDetail_Screens/details_cart.dart';
import 'package:e_sport_store/Views/Main_Navi_Screens/Profile/edit_ProfileScreen.dart';
import 'package:e_sport_store/Widget-Custom/back_ground.dart';
import 'package:e_sport_store/consts/consts.dart';
import 'package:e_sport_store/consts/iconList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
   //var controller =Get.put(AuthController());

   //for profile pic change control
   var controller =Get.put(ProfileController());

    return bgWidget(
    child: Scaffold(  
      body:  StreamBuilder(
        stream: firestoreServices.getUser(currentUser! .uid),

       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData){
          return const Center(
           child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(redColor),
           ),
          );
        }
        else{
        
        var data =snapshot.data!.docs[0];
        return SafeArea(
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: const Align(alignment: Alignment.topRight,
                 child: Icon(Icons.edit,color:whiteColor)).onTap(() {
                  
                     controller.nameController.text =data['name'];
                     //controller.passController.text= data['password'];
                  
                   Get.to(()=> EditProfileScreen(data:data));
                  
              }),
              ),
       
        
     

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
         children: [
          data['imageUrl'] ==''?

        Image.asset(imgProfile2,width: 90,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
        : Image.network(data['imageUrl'],width: 90,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),

       10.heightBox,
       Expanded(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          " ${data['name']}".text.fontFamily(semibold).white.make(),
        "   ${data['email']}".text.white.make(),
         ],
       )),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
          side: const BorderSide(
          color: whiteColor,
           
          )),
          onPressed: () async {
            await Get.put(AuthController()).signoutMethod(context);
            Get.offAll(()=> const loginScreen());
          },
          child: 'logOut'.text.fontFamily(semibold).white.make(),
        )
       ],
      ),
      ),
       
     //User details section

      20.heightBox,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
         detailsCard(count:"00", title:"In your Card", width:context.screenWidth/3.4 ),
            detailsCard(count:"10", title:"In your WishList", width:context.screenWidth/3.4 ),
                detailsCard(count:"07", title:"Your Orders ", width:context.screenWidth/3.4 ),

                   
        ],
      ),
      20.heightBox,
    //profile screen button sections
    ListView.separated(
      shrinkWrap: true,
       separatorBuilder: (context, index){
        return const Divider(color: lightGrey);
       },
       itemCount: profileButtonList.length,
       itemBuilder: (BuildContext context, int index) {
         return ListTile(
          leading: Image.asset(profileuttonIcons[index],width:22),
          
          title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
         );
       },
       ).box.white.rounded.padding(EdgeInsets.symmetric(horizontal: 16)).make(),
            ],
          ));    
        }      
//End of the main column childern
       
        },
      ),
    ),
  );
  
  }
}