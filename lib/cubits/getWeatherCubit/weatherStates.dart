// ignore_for_file: file_names

import 'package:weathernow/models/weatherModel.dart';

abstract class WeatherState {}

class NoWeatherState extends WeatherState {}

class InfoState extends WeatherState {
  final WeatherModel weatherModel;
  InfoState({required this.weatherModel});
}

class FailerState extends WeatherState {}
class NetworkFailerState extends WeatherState {}


