import 'package:builder_tutorial/services/weather_network_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Youtube!"),
      ),
      body: FutureBuilder(
        future: WeatherNetworkService.getWeatherData("Karlsruhe"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Icon(
                Icons.check_box,
                color: Colors.green,
                size: 128.0,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 128.0,
              ),
            );
          } else {
            return LinearProgressIndicator(
              value: null,
            );
          }
        },
      ),
    );
  }
}
