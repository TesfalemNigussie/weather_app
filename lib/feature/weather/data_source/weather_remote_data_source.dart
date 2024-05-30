import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/core/error/error.dart';
import 'package:weather_app/core/config/key.dart';

import 'dto/get_weather_response.dart';

class WeatherRemoteDataSource {
  static final WeatherRemoteDataSource _instance =
      WeatherRemoteDataSource._internal();

  factory WeatherRemoteDataSource() {
    return _instance;
  }

  WeatherRemoteDataSource._internal();

  Future<(GetWeatherResponse?, AppError?)> getWeather(
      {required double latitude, required double longitude}) async {
    try {
      final url = Uri.parse(
          '$baseUrl/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final result = GetWeatherResponse.fromJson(data);
        return (result, null);
      } else {
        return (
          null,
          AppError(
            message: "Oops! error has occurred please try again",
          ),
        );
      }
    } catch (ex) {
      return (
        null,
        AppError(
          message: "Oops! error has occurred please try again",
        ),
      );
    }
  }
}
