import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/connectivity/connectivity.dart';
import 'core/toast/toast.dart';
import 'feature/location/repository/location_repository.dart';
import 'feature/location/repository/location_repository_impl.dart';
import 'feature/weather/presentation/page/weather_home_page.dart';
import 'feature/weather/repository/weather_repository.dart';
import 'feature/weather/repository/weather_repository_impl.dart';

main() async {
  await initApp();

  runApp(
    GetMaterialApp(
      home: HomePage(),
    ),
  );

  ConnectionUtil.getInstance().connectionChange.listen((event) {
    if (!event) {
      Toast.errorMessage(
        message: 'No Internet Connection',
      );
    }
  });
}

initApp() async {

  await Hive.initFlutter();
  await Hive.openBox('weatherApp');

  Get.lazyPut<WeatherRepository>(() => WeatherRepositoryImpl());
  Get.lazyPut<LocationRepository>(() => LocationRepositoryImpl());
}
