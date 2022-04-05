
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather_app/network/app_constants.dart';
import 'package:weather_app/network/response/daily_forecast_response.dart';
import 'package:weather_app/network/response/location_by_lat_lon.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class WeatherApi{

  factory WeatherApi(Dio dio) = _WeatherApi;

  @GET(END_POINT_LOCATION_BY_LAT_LON)
  Future<LocationByLatLon> getWeatherDataByLatLon(
      @Query(LAT) String lat,
      @Query(LON) String lon,
      @Query(APP_ID) String appId,
      @Query(UNITS) String units,
  );

  @GET(END_POINT_DAILY_FORECAST)
  Future<DailyForecastResponse> getDailyWeatherData(
      @Query(LAT) String lat,
      @Query(LON) String lon,
      @Query(APP_ID) String appId,
      @Query(EXCLUDE) String exclude,
      @Query(UNITS) String units,
  );

  @GET(END_POINT_SEARCH_BY_NAME)
  Future<LocationByLatLon> getSearchByName(
      @Query(NAME) String q,
      @Query(APP_ID) String appId,
      @Query(UNITS) String units,
  );

}