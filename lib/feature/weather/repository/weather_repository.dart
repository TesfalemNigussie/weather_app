import 'package:weather_app/core/error/error.dart';

import '../data_source/dto/get_weather_response.dart';

abstract class WeatherRepository {
  Future<(GetWeatherResponse?, AppError?)> getWeather(
      {required double latitude, required double longitude});

  Future<(GetWeatherResponse?, AppError?)> getCachedWeather();

  Future<bool> updateCachedWeather(
      {required GetWeatherResponse weatherResponse});
}
