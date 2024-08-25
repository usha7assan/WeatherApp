// ignore_for_file: file_names
class WeatherModel {
  final String cityName;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text']);
  }
}