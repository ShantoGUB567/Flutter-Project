import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherCardAct extends StatelessWidget {

  final Weather weather;

  const WeatherCardAct({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Column(
        children: [
          Text(
            weather.cityName,
          ),
          Text(
            '&{weather.temperature.toStringAsFixed(1)}C'
          ),
          Text(
            weather.description,
          )
        ],
      )
    );
  }
}
