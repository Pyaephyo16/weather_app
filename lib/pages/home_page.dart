import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/blocs/home_bloc.dart';
import 'package:weather_app/data/daily_vos/daily_vo.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/model/weather_model_impl.dart';
import 'package:weather_app/data/vos/sys_vo.dart';
import 'package:location/location.dart';
import 'package:weather_app/pages/search_by_name_page.dart';
import 'package:weather_app/pages/seven_days_forecast_page.dart';
import 'package:weather_app/resources/colors.dart';
import 'package:weather_app/resources/dimens.dart';
import 'package:weather_app/widgets/seven_days_forecast.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(null),
      child: Scaffold(
        body: Selector<HomeBloc,bool>(
          selector: (context,bloc) => bloc.isNight,
          shouldRebuild: (previous,next) => previous != next,
          builder: (context,isNight,child) =>
           RefreshIndicator(

             onRefresh: ()async{
               HomeBloc bloc = Provider.of(context,listen: false);
               bloc.refreshData();
               print("Finished refresh");
               //bloc.deleteDailyWeatherFromDatabase();
             },

             child: SingleChildScrollView(
               child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                      colors: [
                          (isNight) ? NIGHT_COLOR : DAY_COLOR,
                          HOME_SCREEN_BACKGROUND_CONSTANT_COLOR_1,
                          HOME_SCREEN_BACKGROUND_CONSTANT_COLOR_2,
                      ]
                  ),
                ),
                padding: EdgeInsets.only(top: MARGIN_MEDIUM_3X),
                child: Column(
                  children: [
                      Selector<HomeBloc,SysVO>(
                       selector: (context,bloc) => bloc.latLonData ?? SysVO.emptySituation(),
                       shouldRebuild: (previous,next) => previous != next,
                       builder: (context,latLonData,child) =>
                        (latLonData.country == null) 
                        ? Center(child: CircularProgressIndicator(),)
                        : LocationView(
                          latLonData: latLonData,
                          isNight: isNight,
                          ),
                      ),
                      SizedBox(height: MARGIN_MEDIUM),
                      SearchByNameView(
                        onClick: () =>
                        _nevigateToNextScreen(context, SearchByNamePage(isNight: isNight)),
                        isNight: isNight,
                      ),
                      Column(
                        children: [
                          Selector<HomeBloc,SysVO>(
                       selector: (context,bloc) => bloc.latLonData ?? SysVO.emptySituation(),
                       shouldRebuild: (previous,next) => previous != next,
                       builder: (context,latLonData,child) =>
                            ShowIconView(
                              latLonData: latLonData,
                              isNight: isNight,
                              ),
                          ),
                          SizedBox(height: MARGIN_MEDIUM_3,),
                          Selector<HomeBloc,SysVO>(
                            selector: (context,bloc) => bloc.latLonData ?? SysVO.emptySituation(),
                            shouldRebuild: (previous,next) => previous != next,
                            builder: (context,latLonData,child) =>
                             ConditionIconsView(
                              iconCode: latLonData.weather?.first.icon ?? "",
                              isNight: isNight,
                            ),
                          ),
                          SizedBox(height: MARGIN_MEDIUM_3,),
                          Selector<HomeBloc,SysVO>(
                       selector: (context,bloc) => bloc.latLonData ?? SysVO.emptySituation(),
                       shouldRebuild: (previous,next) => previous != next,
                       builder: (context,latLonData,child) =>
                            (latLonData.main?.temp == null)  ?
                            Center(child: CircularProgressIndicator(),)
                           : ShowDataView(
                              latLonData: latLonData,
                              isNight: isNight,
                              ),
                          ),
                          SizedBox(height: MARGIN_MEDIUM_3,),
                          Selector<HomeBloc,List<DailyVO>>(
                            selector: (context,bloc) => bloc.daily ?? [],
                            shouldRebuild: (previous,next) => previous != next,
                            builder: (context,daily,child) =>
                           SevenDaysForecastView(
                             daily: daily,
                             isNight: isNight,
                             onClick: (index) {
                             HomeBloc dailyBloc = Provider.of(context,listen: false);
                             dailyBloc.dailyDetail(index).then((value) => 
                             _nevigateToNextScreen(context,SevenDaysForecastPage(
                               //isNight: isNight,
                               userSelectIndex: index,
                               )),
                             );
                             }
                           ),
                          ),
                          SizedBox(height: MARGIN_MEDIUM_3,),
                          
                        ],
                      )
                  ],
                ),
                       ),
             ),
           ),
        )
      ),
    );
  }

  Future<dynamic> _nevigateToNextScreen(BuildContext context,Widget pageWidget) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => pageWidget));
  }
}

class SearchByNameView extends StatelessWidget {
  const SearchByNameView({
    Key? key,
    required this.onClick,
    required this.isNight,
  }) : super(key: key);

  final Function onClick;
  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(
            onPressed: (){
                onClick();
          }, 
          icon: Icon(
            Icons.search_sharp,
            size: 40,
            color: (isNight) ? NIGHT_COLOR : DAY_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}



class ConditionIconsView extends StatelessWidget {

  final String iconCode;
  final bool isNight;

  List<String> codes = [
    "01d","01n",
    "02d","02n",
    "03d","03n",
    "04d","04n",
    "09d","09n",
    "10d","10n",
    "11d","11n",
    "13d","13d",
    "50d","50n",
    ];

  ConditionIconsView({required this.iconCode,required this.isNight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ROW_ICONS_CONTAINER_HEIGHT,
      padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
      child: ListView.separated(
        separatorBuilder: (context,index) => SizedBox(width: MARGIN_SMALL_1x,),
        scrollDirection: Axis.horizontal,
        itemCount: codes.length,
        itemBuilder: (BuildContext context,int index){
          return RowIconsData(
            codes: codes,
            index: index,
            icon: iconCode,
            isNight: isNight,
            );
        },
      ),
    );
  }
}

class RowIconsData extends StatelessWidget {
  const RowIconsData({
    Key? key,
    required this.codes,
    required this.index,
    required this.icon,
    required this.isNight,
  }) : super(key: key);

  final List<String> codes;
  final int index;
  final String icon;
  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ROW_ICONS_CONTAINER_WIDTH,
      height: ROW_ICONS_CONTAINER_HEIGHT,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3X),
        border: Border.all(width: 2,color: Colors.black),
        color: (icon == codes[index]) ? (isNight) ? NIGHT_COLOR : DAY_COLOR : Colors.transparent,
      ),
      child: Image.network("http://openweathermap.org/img/wn/${codes[index]}.png",),
    );
  }
}


class ShowDataView extends StatelessWidget {
  const ShowDataView({
    Key? key,
    required this.latLonData,
    required this.isNight,
  }) : super(key: key);

  final SysVO latLonData;
  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Text("${latLonData.main?.temp}  ℃",
              style: TextStyle(
                fontSize: TEXT_LARGE,
                color: (isNight) ? DAY_TEXT_COLOR : NIGHT_COLOR,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
          Container(
            width: CURRENT_WEATHER_SHOW_MIDDLE_BORDER_WIDTH,
            height: CURRENT_WEATHER_SHOW_MIDDLE_BORDER_HEIGHT,
            color: (isNight) ? DAY_TEXT_COLOR : NIGHT_COLOR,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat("EEEE  \nMM/dd/yyyy").format(DateTime.now()),
                  style: TextStyle(
                    color: (isNight) ? DAY_TEXT_COLOR : NIGHT_COLOR,
                    fontWeight: FontWeight.w600,
                    fontSize: MARGIN_MEDIUM_2X,
                  ),
                  ),
                  SizedBox(height: 8,),
                  Text("${latLonData.weather?[0].description}",
                  style: TextStyle(
                    color: (isNight) ? DAY_TEXT_COLOR : NIGHT_COLOR,
                    fontWeight: FontWeight.w600,
                    fontSize: MARGIN_MEDIUM_2X,
                  ),
                  ),
                ],
              ),
            ),
            ),
        ],
      ),
    );
  }
}

class ShowIconView extends StatelessWidget {
  const ShowIconView({
    Key? key,
    required this.latLonData,
    required this.isNight,
  }) : super(key: key);

  final SysVO latLonData;
  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: CANVAS_CONTAINER_WIDTH,
        height: CANVAS_CONTAINER_HEIGHT,
        padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        child: CustomPaint(
          size: Size(300, 300),
          painter: WeatherIconData(
            isNight: isNight,
          ),
           child: Center(
             child: Container(
               width: CANVAS_ICON_CONTAINER_WIDTH,
               height: CANVAS_ICON_CONTAINER_HEIGHT,
               child: Image.network("http://openweathermap.org/img/wn/${latLonData.weather?[0].icon}.png",
               fit: BoxFit.cover,
       ),
             ),
           ),
        ),
      ),
    );
  }
}

class WeatherIconData extends CustomPainter{

  WeatherIconData({required this.isNight});

  final bool isNight;

 var pointsOne = [
   Offset(135, 60),

   Offset(182, 76),
   Offset(214, 110),

   Offset(226, 154),

   Offset(212, 200),
   Offset(174, 232),

    Offset(135,244),

   Offset(60,200),
   Offset(88,228),

   Offset(44, 156),

   Offset(56, 112),
   Offset(82, 78),

    Offset(135, 26),
   Offset(254, 154),
   Offset(135,268),
   Offset(18, 156),
      ];

  @override
  void paint(Canvas canvas, Size size) {
       var paintOne = Paint()
    ..strokeWidth = 14.0
    ..color = (isNight) ? Color.fromRGBO(0, 153, 153, 1.00)  : Color.fromRGBO(51, 51, 51, 1.00)
    ..style = PaintingStyle.stroke;

     var paintTwo = Paint()
    ..strokeWidth = 54.0
    ..color = (isNight) ? Color.fromRGBO(51, 51, 51, 1.00)  : Color.fromRGBO(0, 153, 153, 1.00)
    ..style = PaintingStyle.stroke;


    var paintThree = Paint()
    ..strokeWidth = 2.0
    ..color = Colors.transparent
    ..style = PaintingStyle.fill;

    var paintFour = Paint()
    ..strokeWidth = 4.0
    ..color = Colors.white
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;

    var notiPaintOuter = Paint()
    ..strokeWidth = 4.0
    ..color = Colors.green
    ..style = PaintingStyle.stroke;

     var notiPaintInner = Paint()
    ..strokeWidth = 4.0
    ..color = Colors.grey
    ..style = PaintingStyle.fill;

     var underNotiPainter = Paint()
    ..strokeWidth = 4.0
    ..color = Colors.white
    ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width /2, size.height / 2), 140, paintOne);
    canvas.drawCircle(Offset(size.width /2, size.height / 2), 106, paintTwo);
    canvas.drawPoints(PointMode.points, pointsOne, paintFour);
    canvas.drawCircle(Offset(size.width /2, size.height / 2), 87, paintThree);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class LocationView extends StatelessWidget {
  const LocationView({
    Key? key,
    required this.latLonData,
    required this.isNight,
  }) : super(key: key);

  final SysVO latLonData;
  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: LOCATION_CONTAINER_WIDTH,
          height: LOCATION_CONTAINER_HEIGHT,
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: ListTile(
            contentPadding: EdgeInsets.only(top: MARGIN_MEDIUM_2),
            title: Text("Your Location",
            style: TextStyle(
              color: (isNight) ? NIGHT_COLOR : DAY_COLOR,
              fontSize: TEXT_MEDIUM_2,
              fontWeight: FontWeight.w700,
            ),
            ),
            subtitle: Text("${latLonData.country} - ${latLonData.name}",
            style: TextStyle(
              color: (isNight) ? NIGHT_COLOR : DAY_COLOR,
              fontSize: TEXT_REGULAR_1,
              fontWeight: FontWeight.w500,
            ),
            ),
          ),
        ),
        Spacer(),
        Container(
      width: DAY_NIGHT_IMAGE_CONTAINER_WIDTH,
      height: DAY_NIGHT_IMAGE_CONTAINER_HEIGHT,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3),
      ),
      child: Image.asset( (isNight) ? "./assets/night.jpg" : "./assets/day.jpg",
      fit: BoxFit.cover,
      ),
    ),
      ],
    );
  }
}