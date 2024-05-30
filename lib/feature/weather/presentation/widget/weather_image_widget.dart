import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherImageWidget extends StatelessWidget {
  final String weatherCode;
  const WeatherImageWidget({super.key, required this.weatherCode});

  @override
  Widget build(BuildContext context) {
    if (weatherCode == "Thunderstorm" ||
        weatherCode == "Drizzle" ||
        weatherCode == "Rain") {
      return Lottie.asset("assets/animations/thunderstorm.json");
    } else if (weatherCode == "Atmosphere" || weatherCode == "Clouds") {
      return Lottie.asset("assets/animations/clouds.json");
    } else {
      return Lottie.asset("assets/animations/sunny.json");
    }
  }
}
