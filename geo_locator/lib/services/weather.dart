import 'package:geo_locator/services/networking.dart';
import 'Location.dart';
import '../screens/location_screen.dart';

const apikey = 'you add your own api key';

class WeatherCondition {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/q=$cityName&appid=$apikey&units=metric';
    NetworkNeeder networkhelper = NetworkNeeder(url);
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  Future<dynamic> getWeatherData() async {
    Locations location = Locations();
    await location.getCurrentLocation();
    NetworkNeeder networkhelper = NetworkNeeder(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitute}&appid=$apikey&units=metric');
    dynamic weatherdata = networkhelper.getData();

    return weatherdata;
  }

  String getWeather(condition) {
    if (condition < 300) {
      return '☁️';
    } else if (condition < 400) {
      return '⛈';
    } else if (condition <= 600) {
      return '🌧';
    } else if (condition < 700) {
      return '⛄️';
    } else if (condition < 800) {
      return '🌥';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '🌤';
    } else {
      return '⛅️';
    }
  }

  String getMessage(temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time ';
    } else if (temp < 10) {
      return '🩳Time for Shorts and shirts 👕';
    } else {
      return 'Bring a 🥼 just in case';
    }
  }
}
