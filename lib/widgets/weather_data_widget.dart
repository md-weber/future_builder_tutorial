import 'package:builder_tutorial/models/weather.dart';
import 'package:flutter/material.dart';

class WeatherDataWidget extends StatelessWidget {
  final Weather weather;

  const WeatherDataWidget({this.weather});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            weather.name,
            style: TextStyle(
              fontSize: 64,
            ),
          ),
          Text(
            "${weather.temperature.toStringAsFixed(2)}°C",
            style: TextStyle(fontSize: 64),
          ),
          weather.temperatureFeeling < 5
              ? Icon(
                  Icons.cloud,
                  color: Colors.grey,
                  size: 72,
                )
              : Icon(
                  Icons.wb_sunny,
                  color: Colors.yellow,
                  size: 72,
                )
        ],
      ),
    );
  }
}
