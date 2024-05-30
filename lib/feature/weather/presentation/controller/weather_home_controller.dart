import 'package:get/get.dart';
import 'package:weather_app/core/toast/toast.dart';
import 'package:weather_app/feature/location/repository/location_repository.dart';
import 'package:weather_app/feature/weather/repository/weather_repository.dart';

import '../model/weather_home_model.dart';

class WeatherHomeController extends GetxController {
  bool _isFetching = false;
  bool get isFetching => _isFetching;
  set isFetching(bool value) {
    _isFetching = value;
    update();
  }

  bool _isFetchingError = false;
  bool get isFetchingError => _isFetchingError;
  set isFetchingError(bool value) {
    _isFetchingError = value;
    update();
  }

  String? cityName;

  WeatherHomeModel? _homeModel;
  WeatherHomeModel? get homeModel => _homeModel;
  set homeModel(WeatherHomeModel? value) {
    _homeModel = value;
    update();
  }

  getCachedWeather() async {
    final result = await Get.find<WeatherRepository>().getCachedWeather();

    if (result.$1 != null) {
      cityName = result.$1?.name;

      homeModel = WeatherHomeModel(
        cityName: result.$1?.name ?? '',
        temperature: '${result.$1?.main?.temp?.toInt().toString()}°',
        windSpeed: result.$1?.wind?.speed?.toString() ?? '-',
        humidity: result.$1?.main?.humidity?.toString() ?? '-',
        rain: result.$1?.rain?.the1H?.toString() ?? '-',
        weatherCode: result.$1?.weather?.firstOrNull?.main ?? '-',
      );
    }
  }

  getWeather() async => await getLocation();

  getFromLocationWeather(double latitude, double longitude) async {
    final result = await Get.find<WeatherRepository>()
        .getWeather(latitude: latitude, longitude: longitude);

    if (result.$1 != null) {
      homeModel = WeatherHomeModel(
        cityName: result.$1?.name ?? '',
        temperature: '${result.$1?.main?.temp?.toInt().toString()}°',
        windSpeed: result.$1?.wind?.speed?.toString() ?? '-',
        humidity: result.$1?.main?.humidity?.toString() ?? '-',
        rain: result.$1?.rain?.the1H?.toString() ?? '-',
        weatherCode: result.$1?.weather?.firstOrNull?.main ?? '-',
      );

      Get.find<WeatherRepository>().updateCachedWeather(
        weatherResponse: result.$1!,
      );

      isFetchingError = false;
    } else {
      isFetchingError = true;
      Toast.errorMessage(message: "Oops, Unable to load weather information");
    }
  }

  getLocation() async {
    isFetching = true;

    final locationResult =
        await Get.find<LocationRepository>().getLocationDetail(
      cityName: cityName ?? 'Addis Ababa, ET',
    );

    if (locationResult.$1 != null &&
        locationResult.$1?.lat != null &&
        locationResult.$1?.lon != null) {
      await getFromLocationWeather(
          locationResult.$1!.lat!, locationResult.$1!.lon!);
    } else {
      isFetchingError = true;
      Toast.errorMessage(message: "Oops, Unable to load city information");
    }

    isFetching = false;
  }
}
