import 'package:hive/hive.dart';
import 'package:weather_app/data/vos/sys_vo.dart';
import 'package:weather_app/persistance/hive_constants.dart';

class LocationByLatLonDao{

  static final LocationByLatLonDao _singleton = LocationByLatLonDao._internal();

  factory LocationByLatLonDao(){
    return _singleton;
  }

  LocationByLatLonDao._internal();

  void saveLocationByLatLonData(String lat,SysVO weatherData) async{
    await getLatLonDataBox().put(lat, weatherData);
  }

  SysVO? getLocationByLatLonData(String lat){
    return getLatLonDataBox().get(lat);
  }

  deletelatlonData(){
    return getLatLonDataBox().clear();
  }

  ///Reactive Programming
  Stream<void> getLatLonDataBoxEventStream(){
    return getLatLonDataBox().watch();
  }

  SysVO? getLocationData(String lat){
      if(getLocationByLatLonData(lat) != null){
      print("Persistance dao lat lon data =================> ${getLocationByLatLonData(lat)}");
        return getLocationByLatLonData(lat);
      }
  }

  Stream<SysVO?> getLocationDataStream(String lat){
    return Stream.value(getLocationByLatLonData(lat));
  }

  Box<SysVO> getLatLonDataBox(){
    return Hive.box<SysVO>(BOX_NAME_LOCATION_BY_LAT_LON);
  }

}