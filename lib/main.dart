import 'package:flutter/material.dart';
import 'package:weather_app/data/daily_vos/daily_list_for_hive_vo.dart';
import 'package:weather_app/data/daily_vos/daily_vo.dart';
import 'package:weather_app/data/daily_vos/temp_vo.dart';
import 'package:weather_app/data/vos/coord_vo.dart';
import 'package:weather_app/data/vos/main_vo.dart';
import 'package:weather_app/data/vos/sys_vo.dart';
import 'package:weather_app/data/vos/weather_vo.dart';
import 'package:weather_app/data/vos/wind_vo.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/pages/search_by_name_page.dart';
import 'package:weather_app/pages/seven_days_forecast_page.dart';
import 'package:weather_app/persistance/hive_constants.dart';

void main()async{

 await Hive.initFlutter();

  Hive.registerAdapter(SysVOAdapter());
  Hive.registerAdapter(WeatherVOAdapter());
  Hive.registerAdapter(MainVOAdapter());
  Hive.registerAdapter(WindVOAdapter());
  Hive.registerAdapter(CoordVOAdapter());
  Hive.registerAdapter(DailyVOAdapter());
  Hive.registerAdapter(TempVOAdapter());
  Hive.registerAdapter(DailyListForHiveVOAdapter());

 await Hive.openBox<SysVO>(BOX_NAME_LOCATION_BY_LAT_LON);
 await Hive.openBox<WeatherVO>(BOX_NAME_WEATHER_VO);
 await Hive.openBox<MainVO>(BOX_NAME_MAIN_VO);
 await Hive.openBox<WindVO>(BOX_NAME_WIND_VO);
 await Hive.openBox<CoordVO>(BOX_NAME_COORD_VO);
 await Hive.openBox<DailyListForHiveVO>(BOX_NAME_DAILY_LIST_FOR_HIVE_VO);

  runApp(
    MyApp(),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
    );
  }
}