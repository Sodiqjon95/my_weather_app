import 'package:flutter/material.dart';
import 'package:my_weather_app/utils/styles.dart';

Widget InfoWidget({required String image, required String text, required String text2})=>Container(
  margin: EdgeInsets.all(10),
  width: double.infinity,
  height: 80,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white.withOpacity(0.5),),
  child: Row(
    // crossAxisAlignment: CrossAxisAlignment.center
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
            color: Colors.white
        ),child: Image.asset(image,fit: BoxFit.cover,)),
      Text(text,style: MyTextStyle.interSemiBold600,),
      Text(text2)
    ],),
);