import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/theme/theme.dart';
import '../controller/weather_home_controller.dart';
import '../widget/change_location_widget.dart';
import '../widget/error_widget.dart';
import '../widget/loading_widget.dart';
import '../widget/weather_image_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    Get.put(WeatherHomeController())
      ..getCachedWeather()
      ..getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<WeatherHomeController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.3, 0.9],
              colors: [
                Colors.blue.shade900,
                Colors.white,
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => DraggableScrollableSheet(
                        builder: (context, scrollController) => ChangeLocation(
                          scrollController: scrollController,
                          onChangeLocation: (value) {
                            controller.cityName = value;
                            controller.getWeather();
                          },
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/location_icon.png',
                        width: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        controller.homeModel?.cityName ?? '',
                        style: fontBlack(
                          18,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (controller.isFetchingError)
                  FetchingErrorWidget(
                    onReload: () => controller.getWeather(),
                  ),
                if (controller.isFetching) const LoadingWidget(),
                const SizedBox(
                  height: 10,
                ),
                WeatherImageWidget(
                  weatherCode: controller.homeModel?.weatherCode ?? '',
                ),
                const Spacer(),
                Text(
                  controller.homeModel?.temperature ?? '',
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade100,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icons/wind_icon.png",
                              width: 18,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${controller.homeModel?.windSpeed} Km/h',
                              style: fontSemiBold(
                                12,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'wind',
                              style: fontRegular(
                                12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade100,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icons/humidity_icon.png",
                              width: 18,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${controller.homeModel?.humidity}',
                              style: fontSemiBold(
                                12,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Humidity',
                              style: fontRegular(
                                12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade100,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icons/rain_icon.png",
                              width: 18,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${controller.homeModel?.rain}',
                              style: fontSemiBold(
                                12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Rain',
                              style: fontRegular(
                                12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
