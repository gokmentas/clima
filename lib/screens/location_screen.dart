import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});

  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late String cityName;
  late String weatherIcon;
  late String message;

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }

  void updateUI(dynamic weatherData) {
    setState(
      () {
        double temp = weatherData["main"]["temp"];
        temperature = temp.toInt();
        var conditionNumber = weatherData["weather"][0]["id"];
        cityName = weatherData["name"];

        weatherIcon = weatherModel.getWeatherIcon(conditionNumber);
        message = weatherModel.getMessage(temperature);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("images/location_background.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      "$temperature°",
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  "$message in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// double temperature = decodedData["main"]["temp"];
// int conditionNumber = decodedData["weather"][0]["id"];
// String cityName = decodedData["name"];
