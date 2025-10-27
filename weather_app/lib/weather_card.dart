import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/weather_model.dart';
import 'package:lottie/lottie.dart';

class WeatherCardAct extends StatelessWidget {
  final Weather weather;

  const WeatherCardAct({super.key, required this.weather});

  // Helper function to convert timestamp to human-readable time
  String formatTime(int timestamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('hh:mm a').format(time); // e.g., 06:45 AM
  }

  // Select Lottie animation based on description
  String getAnimation(String desc) {
    desc = desc.toLowerCase();
    if (desc.contains("rain")) return "assets/rain.json";
    if (desc.contains("clear")) return "assets/cloud.json";
    if (desc.contains("cloud")) return "assets/snow.json";
    if (desc.contains("haze")) return "assets/clear.json";
    return "assets/lottie/clear.json"; // default
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.blueGrey[700],
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //Icon according to description
            // Lottie animation
            SizedBox(
              height: 100,
              width: 100,
              child: Lottie.asset(getAnimation(weather.description)),
            ),

            // City Name
            Text(
              weather.cityName,
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),

            // Temperature and Description
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${weather.temperature.toStringAsFixed(1)}°C',
                  style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(width: 10),
                Text(
                  weather.description,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Feels Like
            Text(
              'Feels like: ${weather.feelTemp.toStringAsFixed(1)}°C',
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 15),

            // Min/Max Temperature
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Min: ${weather.tempMin.toStringAsFixed(1)}°C',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Max: ${weather.tempMax.toStringAsFixed(1)}°C',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Humidity and Wind
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Humidity: ${weather.humidity}%',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Wind: ${weather.windSpeed} m/s',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Sunrise / Sunset
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Icon(Icons.wb_sunny, color: Colors.yellow),
                    Text(
                      formatTime(weather.sunrise),
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.nights_stay, color: Colors.orangeAccent),
                    Text(
                      formatTime(weather.sunset),
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
