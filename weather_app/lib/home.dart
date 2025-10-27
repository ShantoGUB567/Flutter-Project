import 'package:flutter/material.dart';
import 'package:weather_app/weather_card.dart';
import 'package:weather_app/model/weather_model.dart';
import 'model/weather_service.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  final WeatherService _weatherServices = WeatherService();
  final TextEditingController _controller = TextEditingController();

  bool _isLoading = false;
  Weather? _weather;

  void _getWeather() async {
    // 🧩 Hide keyboard first
    FocusScope.of(context).unfocus();

    // start loading
    setState(() {
      _isLoading = true;
    });

    try {
      // ✅ fixed spelling (fetchWeather)
      final weather = await _weatherServices.fetchWeather(_controller.text);

      setState(() {
        _weather = weather;
        _isLoading = false;
      });

      print("✅ Weather fetched for ${weather.cityName}");
    } catch (e) {
      // stop loading even on error
      setState(() {
        _isLoading = false;
      });

      // show snackbar with error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching weather data: $e")),
      );

      print("❌ Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: _weather != null &&
              _weather!.description.toLowerCase().contains("rain")
              ? const LinearGradient(
            colors: [Colors.grey, Colors.blueGrey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
              : _weather != null &&
              _weather!.description.toLowerCase().contains("clear")
              ? const LinearGradient(
            colors: [Colors.orangeAccent, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
              : const LinearGradient(
            colors: [Colors.grey, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Weather App",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Input field
              TextField(
                controller: _controller,
                keyboardType: TextInputType.text,
                onTap: () {
                  // when user clicks input field, hide weather card
                  setState(() {
                    _weather = null;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter your city",
                  hintStyle: const TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white70,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Button
              ElevatedButton(
                onPressed: _getWeather,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueGrey[700],
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Get Weather",
                  style: TextStyle(fontSize: 20),
                ),
              ),

              const SizedBox(height: 20),

              // Loading Indicator
              if (_isLoading)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(color: Colors.white),
                ),

              // Weather Card
              if (_weather != null)
                WeatherCardAct(weather: _weather!),
            ],
          ),
        ),
      ),
    );
  }
}
