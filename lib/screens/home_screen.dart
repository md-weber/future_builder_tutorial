import 'package:builder_tutorial/models/weather.dart';
import 'package:builder_tutorial/services/weather_network_service.dart';
import 'package:builder_tutorial/widgets/weather_data_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  /// There was a mistake in the video
  /// with the Future, it created a new future for every rebuild.
  ///
  /// I changed it here already I created the future outside of the build function
  /// with that the future is not retriggerd everytime the build method is rebuild.
  ///
  /// See more:
  /// Comment on Reddit - http://tiny.cc/tk7djz - Thanks to chrabeusz
  /// Future Builder - https://www.youtube.com/watch?v=_JECjjT1AAY&t=2s

  Future weatherFuture = WeatherNetworkService.getWeatherData("Karlsruhe");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Youtube!"),
      ),
      body: FutureBuilder(
        future: weatherFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return WeatherDataWidget(
              weather: snapshot.data,
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
