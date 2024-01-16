import 'package:e_sport_store/consts/consts.dart';

Widget featureButton({String? title, icon}){
  return Row(
   children: [
    Image.asset(icon ,width: 40, fit: BoxFit.fill,),
    10.heightBox,
     title!.text.fontFamily(semibold).color(darkFontGrey).make(),

    ],
  );
}