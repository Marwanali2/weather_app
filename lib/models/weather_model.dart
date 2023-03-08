import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherCondition;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: data['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      minTemp: jsonData['mintemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      weatherCondition: jsonData['condition']['text'],
    );
  }

  @override
  String toString() {
    // بتتنفذ عن تنفيذ الكلاس
    return 'weatherCondition=$weatherCondition';
  }

  String getImage() {
    if (weatherCondition == 'Sunny' || weatherCondition == 'Clear') {
      return 'assets/images/clear.png';
    } else if (weatherCondition == 'Blizzard' ||
        weatherCondition == 'Patchy snow possible' ||
        weatherCondition == 'Patchy sleet possible' ||
        weatherCondition == 'Patchy freezing drizzle possible' ||
        weatherCondition == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherCondition == 'Freezing fog' ||
        weatherCondition == 'Fog' ||
        weatherCondition == 'Heavy cloud' ||
        weatherCondition == 'Mist' ||
        weatherCondition == 'Fog' ||
        weatherCondition == 'partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherCondition == 'Patchy rain possible' ||
        weatherCondition == 'Heavy rain' ||
        weatherCondition == 'Showers	' ||
        weatherCondition == 'Moderate rain') {
      return 'assets/images/rainy.png';
    } else if (weatherCondition == 'Thundery outbreaks possible' ||
        weatherCondition == 'Moderate or heavy snow with thunder' ||
        weatherCondition == 'Patchy light snow with thunder' ||
        weatherCondition == 'Moderate or heavy rain with thunder' ||
        weatherCondition == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherCondition == 'Sunny' || weatherCondition == 'Clear') {
      return Colors.orange;
    } else if (weatherCondition == 'Blizzard' ||
        weatherCondition == 'Patchy snow possible' ||
        weatherCondition == 'Patchy sleet possible' ||
        weatherCondition == 'Patchy freezing drizzle possible' ||
        weatherCondition == 'Blowing snow' ||
        weatherCondition == 'Heavy snow' ||
        weatherCondition == 'Patchy rain possible' ||
        weatherCondition == 'Heavy rain' ||
        weatherCondition == 'Showers	' ||
        weatherCondition == 'Moderate rain') {
      return Colors.blue;
    } else if (weatherCondition == 'Freezing fog' ||
        weatherCondition == 'Fog' ||
        weatherCondition == 'Heavy cloud' ||
        weatherCondition == 'Mist' ||
        weatherCondition == 'Fog' ||
        weatherCondition == 'partly cloudy') {
      return Colors.blueGrey;
    } else if (weatherCondition == 'Thundery outbreaks possible' ||
        weatherCondition == 'Moderate or heavy snow with thunder' ||
        weatherCondition == 'Patchy light snow with thunder' ||
        weatherCondition == 'Moderate or heavy rain with thunder' ||
        weatherCondition == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
