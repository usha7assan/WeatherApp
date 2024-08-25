// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernow/cubits/getWeatherCubit/weatherStates.dart';
import 'package:weathernow/models/weatherModel.dart';
import 'package:weathernow/services/weatherService.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;

  getCurrentWeather({required String cityName}) async {
    try {
      weatherModel =
          await Weatherservice(Dio()).getCurrentWeather(cityName: cityName);
      emit(InfoState(weatherModel: weatherModel!));
    } catch (e) {
      if (e.toString().contains("connection error")) {
        emit(NetworkFailerState());
      } else {
        emit(FailerState());
      }
    }
  }
}
