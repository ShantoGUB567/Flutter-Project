class Weather {
  final String cityName;
  final double temperature;
  final double temp_max;
  final double temp_min;
  final String description;
  final String humidity;
  final double windSeed;
  final int sunrise;
  final int sunset;

  Weather ({
    required this.cityName,
    required this.temperature,
    required this.temp_max,
    required this.temp_min,
    required this.description,
    required this.humidity,
    required this.windSeed,
    required this.sunrise,
    required this.sunset,
});
  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
        cityName: json["name"],
        temperature: json["main"]["temp"] -273.15,
        temp_max: json["main"]["temp_max"] -273.15,
        temp_min: json["main"]["temp_min"] -273.15,
        description: json["weather"]["description"],
        humidity: json["main"]["humidity"],
        windSeed: json["wind"]["speed"],
        sunrise: json["sys"]["sunrise"],
        sunset: json["sys"]["sunset"]);
  }
}