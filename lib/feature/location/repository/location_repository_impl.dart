import 'package:weather_app/core/error/error.dart';
import '../data_source/dto/get_location_response.dart';
import '../data_source/location_remote_data_source.dart';
import 'location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  @override
  Future<(GetLocationResponse?, AppError?)> getLocationDetail(
      {required String cityName}) {
    return LocationRemoteDataSource().getLocationDetail(cityName: cityName);
  }
}
