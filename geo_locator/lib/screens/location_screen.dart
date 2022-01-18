import 'package:flutter/material.dart';
import 'package:geo_locator/screens/city_screen.dart';
import 'package:geo_locator/utilities/Constant.dart';
import 'package:geo_locator/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.weatherData});
  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? temperature;
  String? condition;
  String? cityName;
  @override
  void initState() {
    super.initState();
  }

  var weather = WeatherCondition();
  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = '0';
        condition = 'Error';
        cityName = 'Unable to Locate';
        return;
      }
      temperature = weatherData['main']['temp'].toString();
      condition = weatherData['weather'][0]['id'].toString();
      cityName = weatherData['name'];
    });
  }

  WeatherCondition wCondition = WeatherCondition();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/android-wallpaper.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        var weatherData = weather.getWeatherData();
                        updateUI(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 220.0,
                    ),
                    TextButton(
                      onPressed: () async {
                        String cityNamed = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }));
                        if (cityNamed != null) {
                          var weatherData = await WeatherCondition()
                              .getCityWeather(cityNamed);
                          updateUI(weatherData);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$temperature°C',
                        style: textcolor,
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        wCondition.getWeather(condition),
                        style: textcolor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        '${wCondition.getMessage(temperature)}in$cityName',
                        style: textcolor2)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
