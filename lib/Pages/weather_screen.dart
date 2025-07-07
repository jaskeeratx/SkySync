import 'package:flutter/material.dart';
import 'package:weather_app/Components/heading.dart';
import 'package:weather_app/Components/weather_card.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});
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
            child: Icon(Icons.refresh, color: Colors.white),
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
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color.fromRGBO(50, 41, 41, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 230,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
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
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 4, bottom: 8),
              child: heading(heading1),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                weatherCard(time, temperature),
                weatherCard(time, temperature),
                weatherCard(time, temperature),
                weatherCard(time, temperature),
                weatherCard(time, temperature),
              ],
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

  Column detailCard(IconData icon, String weather, double temp) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, size: 42),
        Text(weather, style: TextStyle(fontSize: 16)),
        Text(temp.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
