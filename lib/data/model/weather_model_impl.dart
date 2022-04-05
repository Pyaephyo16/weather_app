import 'package:stream_transform/stream_transform.dart';
import 'package:weather_app/data/daily_vos/daily_list_for_hive_vo.dart';
import 'package:weather_app/data/daily_vos/daily_vo.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/vos/coord_vo.dart';
import 'package:weather_app/data/vos/main_vo.dart';
import 'package:weather_app/data/vos/sys_vo.dart';
import 'package:weather_app/data/vos/weather_vo.dart';
import 'package:weather_app/data/vos/wind_vo.dart';
import 'package:weather_app/network/app_constants.dart';
import 'package:weather_app/network/data_agents/retrofit_data_agent_impl.dart';
import 'package:weather_app/network/data_agents/weather_data_agent.dart';
import 'package:weather_app/persistance/daos/daily_weather_dao.dart';
import 'package:weather_app/persistance/daos/location_by_lat_lon_dao.dart';

class WeatherModelImpl extends WeatherModel{

  WeatherDataAgent _dataAgent = RetrofitDataAgentImpl();

  static final WeatherModelImpl _singleton = WeatherModelImpl._internal();

  factory WeatherModelImpl(){
    return _singleton;
  }

  WeatherModelImpl._internal();

  ///Daos
  LocationByLatLonDao latLonDao = LocationByLatLonDao();
  DailyWeatherDao dailyDao = DailyWeatherDao();


  ///Network
  
  ///Location By lat lon
  @override
  Future<SysVO?> locationByLatLon(String lat, String lon) {
     print("Datalayer layer location by lat lon =============> ${lat} ${lon}");
    return _dataAgent.locationByLatLon(lat, lon,APP_ID_KEY,UNITS_KEY).then((data){
        var weatherData = data?[0] as SysVO;
        weatherData.main = data?[1] as MainVO;
        weatherData.wind = data?[2] as WindVO;
        weatherData.weather = data?[3] as List<WeatherVO>;
        weatherData.coord = data?[4] as CoordVO;
        weatherData.name = data?[5] as String;

       print("Datalayer layer input to database  =============> lat ${lat} ======> data ${weatherData}"); 
        latLonDao.saveLocationByLatLonData(lat, weatherData);

        return Future.value(weatherData);
    });
  }

  ///daily Weather
    @override
  Future<List<DailyVO>?> dailyWeather(String lat, String lon) {
    return _dataAgent.dailyWeather(lat, lon, APP_ID_KEY, EXCLUDE_DATA, UNITS_KEY).then((data){
      List<DailyVO> dailyData = data?.map((day) {
          day.isSelected = false;
          return day;
      }).toList() ?? [];
      print("daily weather check ===============> ${dailyData}");
      DailyListForHiveVO dailyListData = DailyListForHiveVO(dailyList: dailyData);
      print("daily weather data input to dao ===============> ${dailyListData}");
        dailyDao.saveDailyWeather(lat, dailyListData);
        return Future.value(dailyData);
    });
  }

  ///Search by name
   @override
  Future<SysVO?> searchByName(String name) {
      print("Search by name Data layer =================> ${name} ${APP_ID_KEY} ${UNITS_KEY}" );
    return _dataAgent.searchByName(name, APP_ID_KEY, UNITS_KEY).then((value){
        var searchData = value?[0] as SysVO;
          searchData.main = value?[1] as MainVO;
        searchData.wind = value?[2] as WindVO;
        searchData.weather = value?[3] as List<WeatherVO>;
        searchData.dt = value?[4] as int;
        searchData.name = value?[5] as String;
        
        return Future.value(searchData);
    });
  }


  ///Database
  
  //////Location By lat lon Database
    @override
  Stream<SysVO?> locationByLatLonDatabase(String lat, String lon) {
    print("Output location by lat lon data from database =======> ${latLonDao.getLocationByLatLonData(lat)}");
    this.locationByLatLon(lat, lon);
    return latLonDao
    .getLatLonDataBoxEventStream()
    .startWith(latLonDao.getLocationDataStream(lat))
    .map((event) => latLonDao.getLocationByLatLonData(lat));
  }

  
  ///Daily Weather Database
  @override
  Stream<DailyListForHiveVO?> dailyWeatherDatabase(String lat, String lon) {
    print("Output daily weather data from database =======> ${dailyDao.getDailyWeatherData(lat)}");
    this.dailyWeather(lat, lon);
    return dailyDao
    .getDailyWeatherEventStream()
    .startWith(dailyDao.getDailyWeatherDataStream(lat))
    .map((event) => dailyDao.getDailyWeatherData(lat));
  }


  ///Location By lat lon delete from database
  @override
  Future<void> deleteLatlonDataFromDatabase() {
    return Future.value(latLonDao.deletelatlonData());
  
  }

///daily weather delete from database
  @override
  Future<void> deleteDailyDataFromDatabase() {
    return Future.value(dailyDao.deleteDailyData());
  }

 

}