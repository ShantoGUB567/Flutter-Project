class Weather {
  final String cityName;
  final double temperature;
  final double feelTemp;
  final double tempMax;
  final double tempMin;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunrise;
  final int sunset;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.feelTemp,
    required this.tempMax,
    required this.tempMin,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"],
      temperature: json["main"]["temp"].toDouble(),
      feelTemp: json["main"]["feels_like"].toDouble(),
      tempMax: json["main"]["temp_max"].toDouble(),
      tempMin: json["main"]["temp_min"].toDouble(),
      description: json["weather"][0]["description"],
      humidity: json["main"]["humidity"].toInt(),
      windSpeed: json["wind"]["speed"].toDouble(),
      sunrise: json["sys"]["sunrise"],
      sunset: json["sys"]["sunset"],
    );
  }
}
