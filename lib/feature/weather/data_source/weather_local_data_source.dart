import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:weather_app/core/config/cache_key.dart';
import 'package:weather_app/core/error/error.dart';

import 'dto/get_weather_response.dart';

class WeatherLocalDataSource {
  static late Box _storage;

  static final WeatherLocalDataSource _instance =
      WeatherLocalDataSource._internal();

  factory WeatherLocalDataSource() {
    _storage = Hive.box('weatherApp');
    return _instance;
  }

  WeatherLocalDataSource._internal();

  Future<(GetWeatherResponse?, AppError?)> getCachedWeather() async {
    try {
      final response = await _storage.get(lastWeatherCacheKey);

      if (response != null) {
        final data = jsonDecode(response);
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

  Future<bool> updateCachedWeather(
      {required GetWeatherResponse weatherResponse}) async {
    try {
      var oldValue = _storage.get(lastWeatherCacheKey);
      if (oldValue != null) await _removeWeather();
      await _saveWeather(weatherResponse.toJson());
      return true;
    } catch (ex) {
      return false;
    }
  }

  Future<void> _removeWeather() async =>
      await _storage.delete(lastWeatherCacheKey);

  Future _saveWeather(Map<String, dynamic> value) async => await _storage.put(
        lastWeatherCacheKey,
        json.encode(value),
      );
}
