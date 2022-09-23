import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class OneWidget extends StatelessWidget {
  OneWidget({
    Key? key,
    required this.dateFormat,
    required this.dailySunRise,
    required this.dailySunSet,
    required this.dailyTempNight,
    required this.hourlyMain,
    required this.hourlyTemp,
    required this.hourlyWeatherDis,
    required this.timeZone,
  }) : super(key: key);
  String timeZone;
  String hourlyMain;
  double hourlyTemp;
  double dailyTempNight;
  String hourlyWeatherDis;
  int dailySunRise;
  int dailySunSet;
  DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                timeZone,
                style: MyTextStyle.interMedium500.copyWith(fontSize: 20),
              ),
              Text(
                hourlyMain,
                style: MyTextStyle.interMedium500.copyWith(fontSize: 20),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🌡Temp day",
                style: MyTextStyle.interMedium500.copyWith(fontSize: 20),
              ),
              Text(
                hourlyTemp.toString(),
                style: MyTextStyle.interMedium500.copyWith(fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🌡Temp night",
                style: MyTextStyle.interMedium500.copyWith(fontSize: 20),
              ),
              Text(
                dailyTempNight.toString(),
                style: MyTextStyle.interMedium500.copyWith(fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🎐Descriction",
                style: MyTextStyle.interMedium500.copyWith(fontSize: 20),
              ),
              Text(
                hourlyWeatherDis,
                style: MyTextStyle.interMedium500.copyWith(fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🌅 Sunrise",
                style: MyTextStyle.interMedium500.copyWith(fontSize: 20),
              ),
              Text(
                dateFormat
                    .format(
                      DateTime.fromMillisecondsSinceEpoch(dailySunRise * 1000),
                    )
                    .toString(),
                style: MyTextStyle.interMedium500.copyWith(fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🌇 Sunset",
                style: MyTextStyle.interMedium500.copyWith(fontSize: 20),
              ),
              Text(
                dateFormat
                    .format(
                      DateTime.fromMillisecondsSinceEpoch(dailySunSet * 1000),
                    )
                    .toString(),
                style: MyTextStyle.interMedium500.copyWith(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
