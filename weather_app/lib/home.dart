import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_service.dart';
import 'package:weather_app/weather_card.dart';
import 'model/weather_model.dart';

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
    setState(() {
      _isLoading = true;
    });

    try{
      final weather = await _weatherServices.featchWeather(_controller.text);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error fetching weather data"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: _weather !=null && _weather!.description.toLowerCase().contains("rain") ?
            LinearGradient(
              colors: [Colors.grey, Colors.blueGrey],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
                : _weather !=null && _weather!.description.toLowerCase().contains("clear") ?
            LinearGradient(
              colors: [Colors.orangeAccent, Colors.blueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
                :
            LinearGradient(
              colors: [Colors.grey, Colors.lightBlueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text(
                "Weather App",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Enter your city",
                  filled: true,
                  fillColor: Colors.white54,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  )
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: _getWeather,
                  child: Text(
                    "Get Weather",
                    style: TextStyle(fontSize: 20),
                  ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.blueGrey,
                ),
              ), 
              
              if(_isLoading)
                Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(color: Colors.white,),
                ),
              if (_weather !=null)
                WeatherCardAct(weather: _weather!)

            ],
          ),
        ),

      ),
    );
  }
}
