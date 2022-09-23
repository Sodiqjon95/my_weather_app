import 'dart:convert';
import 'package:my_weather_app/api/models/current/currend_weather.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import 'package:my_weather_app/api/models/one_call/one_call_data.dart';
import 'package:my_weather_app/api/models/task_data.dart';
import 'package:my_weather_app/utils/constans.dart';

class ApiProvider {


  static Future<CurrentWeather> getOneCurrentWeatherByText({
    required String searchText,
  }) async {
    try {
      var queryParams = {
        "appid": API_KEY,
        "q": searchText,
      };
      Response response = await https.get(
        Uri.https(
          BASE_URL,
          "/data/2.5/weather",
          queryParams,
        ),
      );
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        return CurrentWeather.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    } finally {}
  }


  static Future<CurrentWeather> getOneCurrentWeatherByLatLong({
    required double latitude,
    required double longitude
  }) async {
    try {
      var queryParams = {
        "appid": API_KEY,
        "lat": latitude.toString(),
        "lon":longitude.toString(),
      };
      Response response = await https.get(
        Uri.https(
          BASE_URL,
          "/data/2.5/weather",
          queryParams,
        ),
      );
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        return CurrentWeather.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    } finally {}
  }


  //----------------------------------------------------------
  static Future<OneCallData> getOneCallWeatherByText({
    required double  latitude,required double  longitude,
  }) async {
    try {
      var queryParams = {
        "lat": latitude.toString(),
        "lon": longitude.toString(),
        "appid": API_KEY,
        "units": "metric",
        "exclude":"minutely,current",
      };
      Response response = await https.get(
        Uri.https(BASE_URL, "/data/2.5/onecall", queryParams),
      );
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        return OneCallData.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    } finally {}
  }
























  static Future<TaskData> getTask() async {
    try {
      Response response = await https.get(
        Uri.parse("https://easyenglishuzb.free.mockoapp.net/country/UZ"),
      );
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        return TaskData.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    } finally {}
  }
}
