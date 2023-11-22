// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_gdsc/controller/geo_data_collector.dart';
import 'package:weather_app_gdsc/utils/custom_colors.dart';
import 'package:weather_app_gdsc/widgets/comfort_level.dart';
import 'package:weather_app_gdsc/widgets/current_weather_widget.dart';
import 'package:weather_app_gdsc/widgets/daily_data_forecast.dart';
import 'package:weather_app_gdsc/widgets/header_widget.dart';
import 'package:weather_app_gdsc/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;

  // call
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App GDSC'),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
                // Set the theme mode based on the switch value
                if (isDarkMode) {
                  Get.changeTheme(ThemeData.dark().copyWith(
                    textTheme: const TextTheme(
                      bodyLarge: TextStyle(color: CustomColors.textColorWhite),
                      bodySmall: TextStyle(color: CustomColors.textColorWhite),
                      bodyMedium: TextStyle(color: CustomColors.textColorWhite),
                    ),
                  ));
                } else {
                  Get.changeTheme(ThemeData.light());
                }
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/clouds.png",
                    height: 200,
                    width: 200,
                  ),
                  const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation(CustomColors.loadingColor),
                    backgroundColor: CustomColors.backgroudColor,
                  )
                ],
              ))
            : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const HeaderWidget(),
                    // for our current temp ('current')
                    CurrentWeatherWidget(
                      weatherDataCurrent:
                          globalController.getData().getCurrentWeather(),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    HourlyDataWidget(
                        weatherDataHourly:
                            globalController.getData().getHourlyWeather()),
                    DailyDataForecast(
                      weatherDataDaily:
                          globalController.getData().getDailyWeather(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ComfortLevel(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather())
                  ],
                ),
              )),
      ),
    );
  }
}
