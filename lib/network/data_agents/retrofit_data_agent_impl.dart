import 'dart:math';

import 'package:dio/dio.dart';
import 'package:weather_app/data/daily_vos/daily_vo.dart';
import 'package:weather_app/network/app_constants.dart';
import 'package:weather_app/network/data_agents/weather_data_agent.dart';
import 'package:weather_app/network/weather_api.dart';

class RetrofitDataAgentImpl extends WeatherDataAgent{

  late WeatherApi _wApi;

   static final RetrofitDataAgentImpl _singleton = RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl(){
    return _singleton;
  }

  RetrofitDataAgentImpl._internal(){

    final dio = Dio();

    dio.options = BaseOptions(
      headers: {
         HEADER_ACCEPT: APPLICATION_JSON,
        HEADER_CONTENT_TYPE: APPLICATION_JSON,
      }
    );

    _wApi = WeatherApi(dio);
  }

  @override
  Future<List?> locationByLatLon(String lat, String lon, String appId,String units) {
    print("Network layer location by lat lon =============> ${lat} ${lon} ${appId} ${units}");
    return _wApi.getWeatherDataByLatLon(lat, lon, appId,units)
    .asStream()
    .map((event) => [event.sys,event.main,event.wind,event.weather,event.coord,event.name])
    .first;
  }

  @override
  Future<List<DailyVO>?> dailyWeather(String lat, String lon, String appId, String exclude, String units) {
    print("Network layer daily weather =============> ${lat} ${lon} ${appId} ${exclude} ${units}  ");
    return _wApi.getDailyWeatherData(lat, lon, appId, exclude, units)
    .asStream()
    .map((event) => event.daily)
    .first;
  }

  @override
  Future<List?> searchByName(String name,String appId,String units) {
     print("Network layer search by name =============>  ${name} ${appId} ${units}  ");
    return _wApi.getSearchByName(name, appId, units)
    .asStream()
    .map((event) => [event.sys,event.main,event.wind,event.weather,event.dt,event.name])
    .first;
  }



}