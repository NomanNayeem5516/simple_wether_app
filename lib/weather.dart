import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_weather_app/model.dart';
import 'package:simple_weather_app/repository.dart';

import 'main.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
   final TextEditingController _controler = TextEditingController();
   weatherModel? _weather;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _controler,
              ),
              ElevatedButton(onPressed: () async {
             _weather = await  Repository().getWeather(_controler.text);

             setState(() {});
              }, child: Text('Search')),
              Text('Temperature${_weather?.main?.temp}'),
              Text('Max Temperature${_weather?.main?.tempMax}'),
              Text('Min Temperature${_weather?.main?.tempMin}')
            ],
          ),
        ),
      ),
    );
  }
}
