import 'package:flutter/foundation.dart';
import 'package:location/location.dart';
import 'package:weather_app/data/daily_vos/daily_vo.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/model/weather_model_impl.dart';
import 'package:weather_app/data/vos/sys_vo.dart';
import 'package:collection/collection.dart';

class HomeBloc extends ChangeNotifier{

  ///Model
  WeatherModel model = WeatherModelImpl();

  ///State Variable
  SysVO? latLonData;
  List<DailyVO>? daily;
  DailyVO? dailyDetailData;

  double? lat;
  double? lon;

  bool isNight = true;
  int hour = DateTime.now().hour;

  HomeBloc(int? userSelectIndex){
      if(hour>=6 && hour<=18){
          isNight = false;
          notifyListeners();
      }

        getLatLon().then((value){
    //       ///Location By Lat Lon
    // model.locationByLatLon(lat ?? 0,lon ?? 0).then((value){
    //   setState(() {
    //     latLonData = value;
    //   });
    // });
    ///Location By Lat Lon Database
    model.locationByLatLonDatabase(lat.toString(), lon.toString()).listen((event){
        latLonData = event;
        notifyListeners();
        
    }).onError((error){
      print("Location By Lat Lon Database Error ================> ${error.toString()}");
    });

//16.8409° N, 96.1735° E
//lat.toString(), lon.toString()

    //Daily Weather
    // model.dailyWeather(lat.toString(),lon.toString()).then((value){
    //       daily = value;
    //       print("Bloc daily data ========================> ${daily}");
    //       notifyListeners();
    //   }).catchError((error){
    //     print("Daily Weather Error ================> ${error.toString()}");
    //   });
    ///Daily Weather Database
    model.dailyWeatherDatabase(lat.toString(), lon.toString()).listen((event) {
        daily = event?.dailyList;
        print("Bloc daily data ========================> ${daily}");
        print("do it again");
        if(userSelectIndex != null){
          dailyDetail(userSelectIndex);
        }
        notifyListeners();
    }).onError((error){
         print("Daily Weather Database Error ================> ${error.toString()}");
    });

      });
      
  }

  Future<void> dailyDetail(int index)async{
    List<DailyVO>? data = daily?.mapIndexed((i,day){
        day.isSelected = false;
        if(i == index){
          day.isSelected = true;
          dailyDetailData = day;
           print("Daily for show data input ====================> ${day}");
          print("Daily for show data ====================> ${dailyDetailData}");
           notifyListeners();
        }
        return day;
    }).toList();
    daily = data;
    notifyListeners();
    return Future.value();
    }


  void refreshData(){
      getLatLon().then((value){
        model.locationByLatLonDatabase(lat.toString(), lon.toString()).listen((event) {
        latLonData = event;
    print("Refreshed completed");
        notifyListeners();
        print("Icon Refresh ========================> ${latLonData?.weather?[0].icon}");
    }).onError((error){
      print("Location By Lat Lon Database Error ================> ${error.toString()}");
    });
      });
  }

    Future<void> getLatLon()async{
       Location location = new Location();

   bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

_serviceEnabled = await location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled = await location.requestService();
  if (!_serviceEnabled) {
    return;
  }
}

_permissionGranted = await location.hasPermission();
if (_permissionGranted == PermissionStatus.denied) {
  _permissionGranted = await location.requestPermission();
  if (_permissionGranted != PermissionStatus.granted) {
    return;
  }
}

_locationData = await location.getLocation();

  print("lat =============> ${_locationData.latitude}");
  print("lon =============> ${_locationData.longitude}");


      lat = _locationData.latitude;
      lon = _locationData.longitude;
      notifyListeners();
  }


  void deleteLatlonDataFromDatabase(){
    model.deleteLatlonDataFromDatabase();
  }

  void deleteDailyWeatherFromDatabase(){
    model.deleteDailyDataFromDatabase();
  }

}