import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/daily_vos/daily_vo.dart';
import 'package:weather_app/resources/colors.dart';
import 'package:weather_app/resources/dimens.dart';

class SevenDaysForecastView extends StatelessWidget {
  const SevenDaysForecastView({
    Key? key,
    required this.daily,
    required this.isNight,
    required this.onClick,
    this.isVisible = true,
  }) : super(key: key);

  final List<DailyVO> daily;
  final bool isNight;
  final Function(int index) onClick;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: isVisible,
          child: SevenDayForecastTitleView(
            isNight: isNight,
          ),
        ),
        SevenDaysForecastDataView(
          daily: daily,
          isNight: isNight,
          onClick: onClick,
          ),
      ],
    );
  }
}

class SevenDaysForecastDataView extends StatelessWidget {
  const SevenDaysForecastDataView({
    Key? key,
    required this.daily,
    required this.isNight,
    required this.onClick,
  }) : super(key: key);

  final List<DailyVO> daily;
  final bool isNight;
  final Function(int index) onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
       height: DAILY_LISTVIEW_CONTAINER_HEIGHT,
       padding: EdgeInsets.symmetric(vertical: MARGIN_SMALL_1x),
       child: ListView.builder(
         scrollDirection: Axis.horizontal,
           itemCount: daily.length,
           itemBuilder: (BuildContext context,int index){
             return SevenDailyData(
               daily: daily,
               index: index,
               isNight: isNight,
               onClick: onClick,
               );
           },
       ),
     );
  }
}

class SevenDailyData extends StatelessWidget {
  const SevenDailyData({
    Key? key,
    required this.daily,
    required this.index,
    required this.isNight,
    required this.onClick,
  }) : super(key: key);

  final List<DailyVO> daily;
  final int index;
  final bool isNight;
  final Function(int index) onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        onClick(index);
      },

      child: Container(
        width: DAILY_DATA_CONTAINER_WIDTH,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3_OVA),
          color: daily[index].isSelected == true ? (isNight) ? NIGHT_COLOR : DAY_COLOR : Colors.white.withOpacity(0.4),
        ),
        margin: EdgeInsets.only(left: MARGIN_MEDIUM_2,right: MARGIN_START),
        padding: EdgeInsets.symmetric(vertical: MARGIN_SMALL,horizontal: MARGIN_START),
      child: Column(
        children: [
          Text(DateFormat("EE\n dd").format(DateTime.fromMillisecondsSinceEpoch((daily[index].dt)! * 1000)),
          style: TextStyle(
            color: (isNight) ? DAY_TEXT_COLOR : NIGHT_COLOR,
            fontSize: TEXT_REGULAR_1X,
            fontWeight: FontWeight.bold,
          ),
          ),
          Spacer(),
          Container(
            width: DAILY_ICON_CONTAINER_WIDTH,
            height: DAILY_ICON_CONTAINER_HEIGHT,
            child: Image.network("http://openweathermap.org/img/wn/${daily[index].weather?.first.icon}.png"),
          ),
          Spacer(),
          Text("${daily[index].temp?.day!.toStringAsFixed(1)} ℃",
          style: TextStyle(
            color: (isNight) ? DAY_TEXT_COLOR : NIGHT_COLOR,
            fontWeight: FontWeight.bold,
            fontSize: TEXT_REGULAR_1,
          ),
          ),
        ],
      ),
      ),
    );
  }
}

class SevenDayForecastTitleView extends StatelessWidget {
  const SevenDayForecastTitleView({
    Key? key,
    required this.isNight,
  }) : super(key: key);

  final bool isNight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
      child: Text("7 Days Forecast",
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: TEXT_MEDIUM_2X,
        fontWeight: FontWeight.w600,
        color:  (isNight) ? DAY_TEXT_COLOR : NIGHT_COLOR,
      ),
      ),
    );
  }
}