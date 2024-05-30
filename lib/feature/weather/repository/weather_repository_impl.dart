import 'package:weather_app/core/error/error.dart';
import 'package:weather_app/feature/weather/data_source/weather_local_data_source.dart';

import '../data_source/dto/get_weather_response.dart';
import '../data_source/weather_remote_data_source.dart';
import 'weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  @override
  Future<(GetWeatherResponse?, AppError?)> getWeather(
      {required double latitude, required double longitude}) {
    return WeatherRemoteDataSource()
        .getWeather(latitude: latitude, longitude: longitude);
  }

  @override
  Future<(GetWeatherResponse?, AppError?)> getCachedWeather() {
    return WeatherLocalDataSource().getCachedWeather();
  }

  @override
  Future<bool> updateCachedWeather(
      {required GetWeatherResponse weatherResponse}) {
    return WeatherLocalDataSource()
        .updateCachedWeather(weatherResponse: weatherResponse);
  }
}
