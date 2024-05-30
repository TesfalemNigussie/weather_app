import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/error/error.dart';
import 'package:weather_app/core/config/key.dart';

import 'dto/get_location_response.dart';

class LocationRemoteDataSource {
  static final LocationRemoteDataSource _instance =
      LocationRemoteDataSource._internal();

  factory LocationRemoteDataSource() {
    return _instance;
  }

  LocationRemoteDataSource._internal();

  Future<(GetLocationResponse?, AppError?)> getLocationDetail(
      {required String cityName}) async {
    try {
      final url = Uri.parse(
          '$baseUrl/geo/1.0/direct?q=$cityName&limit=1&appid=$apiKey');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        return (getLocationResponseFromJson(response.body)[0], null);
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
