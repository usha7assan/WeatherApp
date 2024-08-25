// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernow/cubits/getWeatherCubit/weatherCubit.dart';
import 'package:weathernow/main.dart';
import 'package:weathernow/models/weatherModel.dart';
import 'package:intl/intl.dart';

class Weatherpage extends StatelessWidget {
  const Weatherpage({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<WeatherCubit>(context).weatherModel!;


    String Time = DateFormat('hh:mm a').format(DateTime.now());

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getThemeColor(weatherModel.weatherCondition)[800]!,
          getThemeColor(weatherModel.weatherCondition)[700]!,
          getThemeColor(weatherModel.weatherCondition)[600]!,
          getThemeColor(weatherModel.weatherCondition)[500]!,
          getThemeColor(weatherModel.weatherCondition)[400]!,
          getThemeColor(weatherModel.weatherCondition)[300]!,
          getThemeColor(weatherModel.weatherCondition)[200]!,
          getThemeColor(weatherModel.weatherCondition)[100]!,
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Text(
            'Updated at $Time',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  "https:${weatherModel.image!}",
                ),
                Text(
                  "${weatherModel.temp.round()}°",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Max Temp: ${weatherModel.maxTemp.round()}°",
                      style: const TextStyle(),
                    ),
                    Text(
                      "Min Temp: ${weatherModel.minTemp.round()}°",
                      style: const TextStyle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            weatherModel.weatherCondition,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
