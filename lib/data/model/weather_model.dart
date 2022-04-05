import 'package:weather_app/data/daily_vos/daily_vo.dart';
import 'package:weather_app/data/vos/sys_vo.dart';

import '../daily_vos/daily_list_for_hive_vo.dart';

abstract class WeatherModel{

  ///NetWork
 Future<SysVO?> locationByLatLon(String lat,String lon);
 Future<List<DailyVO>?> dailyWeather(String lat,String lon);
 Future<SysVO?> searchByName(String name);


 ///Database
 Stream<SysVO?> locationByLatLonDatabase(String lat,String lon);
 Stream<DailyListForHiveVO?> dailyWeatherDatabase(String lat,String lon);

  Future<void> deleteLatlonDataFromDatabase();
  Future<void> deleteDailyDataFromDatabase();

}