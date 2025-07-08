import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/.env';
import 'package:weather_app/Components/detail_card.dart';
import 'package:weather_app/Components/heading.dart';
import 'package:weather_app/Components/weather_card.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherApi();
  }

  Future getWeatherApi() async {
    String cityName = 'India';
    final res = await http.get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$api_key",
      ),
    );

    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    double temperature = 0.00;
    String time = '9:00';
    String heading1 = 'Weather Forecast';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                getWeatherApi();
              },
              icon: Icon(Icons.refresh),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                height: 230,
                width: double.infinity,
                child: Card(
                  elevation: 16,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${temperature.toString()}`F',

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.cloud, size: 72),
                            Text(
                              'Rain',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 4, bottom: 8),
              child: heading(heading1),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  weatherCard(time, temperature),
                  weatherCard(time, temperature),
                  weatherCard(time, temperature),
                  weatherCard(time, temperature),
                  weatherCard(time, temperature),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 4, bottom: 8),
              child: heading('Additional Information'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  detailCard(Icons.water_drop, 'Humidity', 95),
                  detailCard(Icons.speed, 'WindSpeed', 7.67),
                  detailCard(Icons.umbrella_rounded, 'Humidity', 1006),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
