import 'package:e_sport_store/consts/consts.dart';

Widget buttonAll({onPress, color, textColor, String? title}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed:onPress, child: title!.text.white.fontFamily(bold).make());
}