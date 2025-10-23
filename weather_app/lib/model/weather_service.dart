import 'package:weather_app/model/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  final String apiKey = API_KEY;

  Future<Weather> featchWeather(String cityName) async {
    final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?id=$cityName&appid=$apiKey");

    final response = await http.get(url);

    if (response.statusCode == 200){
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}