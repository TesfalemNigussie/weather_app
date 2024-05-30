
import 'package:weather_app/core/error/error.dart';

import '../data_source/dto/get_location_response.dart';

abstract class LocationRepository {
  Future<(GetLocationResponse?, AppError?)> getLocationDetail(
      {required String  cityName});
}
