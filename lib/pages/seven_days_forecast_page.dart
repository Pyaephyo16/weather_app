import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/blocs/home_bloc.dart';
import 'package:weather_app/data/daily_vos/daily_vo.dart';
import 'package:weather_app/data/vos/sys_vo.dart';
import 'package:weather_app/resources/colors.dart';
import 'package:weather_app/resources/dimens.dart';
import 'package:weather_app/view_%20items/detail_title_view.dart';
import 'package:weather_app/view_%20items/period_temperature_view.dart';
import 'package:weather_app/view_%20items/pop_button_view.dart';
import 'package:weather_app/widgets/seven_days_forecast.dart';
import 'package:weather_app/widgets/tem_min_max.dart';

class SevenDaysForecastPage extends StatelessWidget {

   //final bool isNight;
   final int userSelectIndex;

    SevenDaysForecastPage({
      //required this.isNight,
      required this.userSelectIndex,
      });

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => HomeBloc(userSelectIndex),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Selector<HomeBloc,bool>(
          selector: (context,bloc) => bloc.isNight,
          shouldRebuild: (previous,next) => previous != next,
          builder: (context,isNight,child) =>
           CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: SLIVER_APPBAR_EXPANDED_HEIGHT,
                automaticallyImplyLeading: false,
                stretch: true,
                backgroundColor: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_COLOR,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                            (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_COLOR,
                          Colors.white,
                      ]),
                    ),
                    padding: EdgeInsets.only(top: MARGIN_MEDIUM_5),
                    child: Selector<HomeBloc,List<DailyVO>>(
            selector: (context,bloc) => bloc.daily ?? [],
            shouldRebuild: (previous,next) => previous != next,
            builder: (context,daily,child) =>
             SevenDaysForecastView(
              daily: daily, 
              isNight: isNight,
              isVisible: false,
              onClick: (index){
               HomeBloc _bloc = Provider.of(context,listen: false);
                _bloc.dailyDetail(index);
              },
              ),
          ),
              ),
              ),
        
              Align(
          alignment: Alignment.topLeft,
          child: PopButtonView(),
              )
                    ],
                  ),
                ),
              ),
        
              SliverList(
                delegate: SliverChildListDelegate([
                      Container(
                       color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_COLOR,
                       child: Selector<HomeBloc,DailyVO>(
            selector: (context,bloc) => bloc.dailyDetailData ?? DailyVO.emptySituation(),
            shouldRebuild: (previous,next) => previous != next,
            builder: (context,day,child) =>
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [       
                           (day.dt) == null ?  Center(
                               child: CircularProgressIndicator(),
                                     )  :   DateView(
                                    day: day,
                               ),
                             SizedBox(height: MARGIN_MEDIUM_4X_EXTRA,),
                             IconDataView(
                               day: day,
                             ),
                             SizedBox(height: MARGIN_MEDIUM_2,),
                             Weatherview(
                               isNight: isNight,
                               day: day,
                             ),
                             SizedBox(height: MARGIN_MEDIUM_2,),
                              TempAllView(
                                isNight: isNight,
                                day: day,
                                ),
                                SizedBox(height: MARGIN_MEDIUM_2,),
                            ],
                          ),
                       ),
                     ),
                ]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconDataView extends StatelessWidget {
  const IconDataView({
    Key? key,
    required this.day,
  }) : super(key: key);

  final DailyVO day;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DETAIL_PAGE_ICON_CONTAINER_HEIGHT,
      child: Image.network("http://openweathermap.org/img/wn/${day.weather?.first.icon}.png",
      fit: BoxFit.cover,
      ),
    );
  }
}

class Weatherview extends StatelessWidget {
  const Weatherview({
    Key? key,
    required this.isNight,
    required this.day,
  }) : super(key: key);

  final bool isNight;
  final DailyVO day;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailTitleView(title: "Conditon"),
        SizedBox(height: MARGIN_SMALL_1x,),
        Container(
                    width: double.infinity,
                    height: DETAIL_CONDITION_CONTAINER_HEIGHT,
                    margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2X),
                    padding: EdgeInsets.all(MARGIN_MEDIUM_3X_EXTRA),
                   decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3X_EXTRA),
                        ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             PeriodTemperatureView(
                 isNight: isNight, 
                 period: "Weather Condition",
                  temp: "${day.weather?.first.description}",
                  ),
               PeriodTemperatureView(
                 isNight: isNight, 
                 period: "Pressure",
                  temp: "${day.pressure}",
                  ),
                   PeriodTemperatureView(
                 isNight: isNight, 
                 period: "Wind Speed",
                  temp: "${day.windSpeed}",
                  ),
                   PeriodTemperatureView(
                 isNight: isNight, 
                 period: "Humandity",
                  temp: "${day.humidity}",
                  ),
           ],
         )
           ),
      ],
    );
  }
}

class TempAllView extends StatelessWidget {
  const TempAllView({
    Key? key,
    required this.isNight,
    required this.day,
  }) : super(key: key);

  final bool isNight;
  final DailyVO day;

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DetailTitleView(
            title: "Temperature",
          ),
          SizedBox(height: MARGIN_SMALL_1x,),
          Container(
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3X_EXTRA),
            padding: EdgeInsets.all(MARGIN_MEDIUM_3X_EXTRA),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3X_EXTRA),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               TempMinMaxView(
                 isNight: isNight,
                 day: day,
                 byNameData: SysVO.emptySituation(),
                 isSearch: false,
                 ),
                 SizedBox(height: MARGIN_SMALL_1x,),
                 PeriodTemperatureView(
                   isNight: isNight,
                   period: "Morning Temperature",
                   temp: "${day.temp?.morn} ℃",
                   ),
                   PeriodTemperatureView(
                   isNight: isNight,
                   period: "Evening Temperature",
                   temp: "${day.temp?.eve} ℃",
                   ),
                   PeriodTemperatureView(
                   isNight: isNight,
                   period: "Night Temperature",
                   temp: "${day.temp?.night} ℃",
                   ),
              ],
            ),
          ),
        ],
      );
  }
}





// class TempMinMaxView extends StatelessWidget {
//   const TempMinMaxView({
//     Key? key,
//     required this.isNight,
//     required this.day,
//   }) : super(key: key);

//   final bool isNight;
//   final DailyVO day;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//          Row(
//        children: [
//          Text("min",
//          style: TextStyle(
//            color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
//            fontSize: TEXT_MEDIUM,
//            fontWeight: FontWeight.w600,
//          ),
//          ),
//          Spacer(),
//          Text("max",
//           style: TextStyle(
//            color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
//            fontSize: TEXT_MEDIUM,
//            fontWeight: FontWeight.w600,
//          ),
//          ),
//        ],
//      ),
//      Row(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: [
//          Text("${day.temp?.min} ℃",
//          style: TextStyle(
//            color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
//            fontSize: TEXT_REGULAR_1X,
//          ),
//          ),
//          Expanded(child: Divider(color: Colors.black,)),
//          Text("${day.temp?.day} ℃",
//          style: TextStyle(
//            color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
//            fontSize: TEXT_REGULAR_1X,
//          ),
//          ),
//          Expanded(child: Divider(color: Colors.black,)),
//          Text("${day.temp?.max} ℃",
//          style: TextStyle(
//            color: (isNight) ? DAILY_DETAIL_NIGHT_COLOR : DAY_TEXT_COLOR,
//            fontSize: TEXT_REGULAR_1X,
//          ),
//          ),
//        ],
//      ),
//       ],
//     );
//   }
// }

class DateView extends StatelessWidget {
  const DateView({
    Key? key,
    required this.day,
  }) : super(key: key);

  final DailyVO day;

  @override
  Widget build(BuildContext context) {
    return Text(DateFormat("EEEE, dd, MMMM").format(DateTime.fromMillisecondsSinceEpoch( (day.dt)! * 1000)),
      style: TextStyle(
        fontSize: TEXT_MEDIUM_2X,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      );
  }
}

