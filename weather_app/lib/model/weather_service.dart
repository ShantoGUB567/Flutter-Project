import 'package:weather_app/model/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  final String apiKey = dotenv.env['API_KEY'] ?? '';

  Future<Weather> fetchWeather(String cityName) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric"
    );

    print("Requesting: $url"); // Debug
    final response = await http.get(url);

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception("City not found");
    } else {
      throw Exception("Failed to load weather data: ${response.statusCode}");
    }
  }
}
