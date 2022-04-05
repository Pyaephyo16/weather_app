import 'package:weather_app/data/daily_vos/daily_vo.dart';
import 'package:weather_app/network/weather_api.dart';

abstract class WeatherDataAgent{

  Future<List<dynamic>?> locationByLatLon(String lat,String lon,String appId,String units);
  Future<List<DailyVO>?> dailyWeather(String lat,String lon,String appId,String exclude,String units);
  Future<List<dynamic>?> searchByName(String name,String appId,String units);

}