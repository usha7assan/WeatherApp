// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:weathernow/models/weatherModel.dart';

class Weatherservice {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '1825b09b26c34702920155247241508';

  Weatherservice(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? e.toString();
      throw Exception(errMessage);
      
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
