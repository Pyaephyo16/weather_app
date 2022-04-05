import 'package:flutter/material.dart';
import 'package:weather_app/resources/colors.dart';
import 'package:weather_app/resources/dimens.dart';

class PeriodTemperatureView extends StatelessWidget {
  const PeriodTemperatureView({
    Key? key,
    required this.isNight,
    required this.period,
    required this.temp,
  }) : super(key: key);

  final bool isNight;
  final String period;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(period,
           style: TextStyle(
          color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
               fontSize: TEXT_REGULAR_1X,
               fontWeight: FontWeight.w600,
              ),
          ),
        ),
       //Spacer(),
        Expanded(
          child: Text(temp,
          style: TextStyle(
           color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
            fontSize: TEXT_REGULAR_1X,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}