import 'package:flutter/material.dart';
import 'package:weather_app/data/daily_vos/daily_vo.dart';
import 'package:weather_app/data/vos/sys_vo.dart';
import 'package:weather_app/resources/colors.dart';
import 'package:weather_app/resources/dimens.dart';

class TempMinMaxView extends StatelessWidget {
  const TempMinMaxView({
    Key? key,
    required this.isNight,
    required this.day,
    required this.byNameData,
    required this.isSearch,
  }) : super(key: key);

  final bool isNight;
  final DailyVO day;
  final SysVO byNameData;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
       children: [
         Text("min",
         style: TextStyle(
           color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
           fontSize: TEXT_MEDIUM,
           fontWeight: FontWeight.w600,
         ),
         ),
         Spacer(),
         Text("max",
          style: TextStyle(
           color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
           fontSize: TEXT_MEDIUM,
           fontWeight: FontWeight.w600,
         ),
         ),
       ],
     ),
     (isSearch) ?
     Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text("${byNameData.main?.temp_min} ℃",
         style: TextStyle(
           color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
           fontSize: TEXT_REGULAR_1X,
         ),
         ),
         Expanded(child: Divider(color: Colors.black,)),
         Text("${byNameData.main?.temp} ℃",
         style: TextStyle(
           color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
           fontSize: TEXT_REGULAR_1X,
         ),
         ),
         Expanded(child: Divider(color: Colors.black,)),
         Text("${byNameData.main?.temp_max} ℃",
         style: TextStyle(
           color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
           fontSize: TEXT_REGULAR_1X,
         ),
         ),
       ],
     )
     : Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text("${day.temp?.min} ℃",
         style: TextStyle(
           color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
           fontSize: TEXT_REGULAR_1X,
         ),
         ),
         Expanded(child: Divider(color: Colors.black,)),
         Text("${day.temp?.day} ℃",
         style: TextStyle(
           color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
           fontSize: TEXT_REGULAR_1X,
         ),
         ),
         Expanded(child: Divider(color: Colors.black,)),
         Text("${day.temp?.max} ℃",
         style: TextStyle(
           color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
           fontSize: TEXT_REGULAR_1X,
         ),
         ),
       ],
     ),
      ],
    );
  }
}