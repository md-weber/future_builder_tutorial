class Weather {
  String name;
  double temperature;
  double temperatureFeeling;

  Weather(this.name, this.temperature, this.temperatureFeeling);

  factory Weather.fromJson(Map<String, dynamic> jsonResponse) => Weather(
        jsonResponse["name"],
        jsonResponse["main"]["temp"],
        jsonResponse["main"]["feels_like"],
      );
}
