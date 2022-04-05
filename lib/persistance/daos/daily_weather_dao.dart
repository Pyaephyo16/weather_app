import 'package:hive/hive.dart';
import 'package:weather_app/data/daily_vos/daily_list_for_hive_vo.dart';
import 'package:weather_app/persistance/hive_constants.dart';

class DailyWeatherDao{

static final DailyWeatherDao _singleton = DailyWeatherDao._internal();

factory DailyWeatherDao(){
  return _singleton;
}

  DailyWeatherDao._internal();

  void saveDailyWeather(String lat,DailyListForHiveVO daily)async{
    await getDailyBox().put(lat, daily);
  }

  DailyListForHiveVO? getDailyWeather(String lat){
    return getDailyBox().get(lat);
  }

  deleteDailyData(){
    getDailyBox().clear();
  }

  ///Reactive Programming
  Stream<void> getDailyWeatherEventStream(){
    return getDailyBox().watch();
  }

  DailyListForHiveVO? getDailyWeatherData(String lat){
    if(getDailyWeather(lat) != null){
      print("Persistance dao daily data =================> ${getDailyWeather(lat)}");
      return getDailyWeather(lat);
    }
  }

  Stream<DailyListForHiveVO?> getDailyWeatherDataStream(String lat){
    return Stream.value(getDailyWeather(lat));
  } 

  Box<DailyListForHiveVO> getDailyBox(){
    return Hive.box<DailyListForHiveVO>(BOX_NAME_DAILY_LIST_FOR_HIVE_VO);
  }

}