import 'package:builder_tutorial/models/weather.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  const WeatherWidget({this.weather});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather.name,
            style: TextStyle(fontSize: 72),
          ),
          Text(
            "${weather.temperature.toStringAsFixed(2)} °C",
            style: TextStyle(fontSize: 72),
          ),
          weather.temperatureFeeling < 10
              ? Icon(
                  Icons.wb_cloudy,
                  color: Colors.green,
                  size: 128.0,
                )
              : Icon(
                  Icons.wb_sunny,
                  color: Colors.yellow,
                  size: 128.0,
                ),
        ],
      ),
    );
  }
}
