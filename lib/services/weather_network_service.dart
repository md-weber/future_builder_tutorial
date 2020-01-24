import 'package:builder_tutorial/models/weather.dart';
import 'package:builder_tutorial/services/env_variables.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const apiUrl = "http://api.openweathermap.org/data/2.5/weather";

class WeatherNetworkService {
  static Future<Weather> getWeatherData(cityName) async {
    /// Environment is my personal API keystore and not in Github, just grab your own from
    /// https://home.openweathermap.org/api_keys
    /// 1. Register
    /// 2. Generate Api key
    String openWeatherUrl = "$apiUrl?q=$cityName&appid=${Environment.apiKey}&units=metric";

    var response = await http.get(openWeatherUrl);
    await Future.delayed(Duration(seconds: 5));

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return Weather.fromJson(jsonResponse);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
