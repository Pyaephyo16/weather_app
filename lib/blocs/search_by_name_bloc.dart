import 'package:flutter/foundation.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/model/weather_model_impl.dart';
import 'package:weather_app/data/vos/sys_vo.dart';

class SearchByNameBloc extends ChangeNotifier{

///Model
WeatherModel model = WeatherModelImpl();

///State Variables
SysVO? byNameData;

  searchByName(String name){
    model.searchByName(name).then((value){
        byNameData = value;
        notifyListeners();
    });
  }

}