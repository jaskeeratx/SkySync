import 'dart:convert';
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
  Future<Map<String, dynamic>> getWeatherApi() async {
    String cityName = 'Delhi';

    try {
      final res = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$api_key",
        ),
      );
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw (data[0]['message']);
      }
      return data;
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
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
                setState(() {});
              },
              icon: Icon(Icons.refresh),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getWeatherApi(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(width: 50, child: LinearProgressIndicator()),
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          final data = snapshot.data!;
          final weatherData = data['list'][0];
          final weatherTemp = weatherData['main']['temp'];
          final weatherIcon = weatherData['weather'][0]['main'];
          final pressure = weatherData['main']['pressure'];
          final humidity = weatherData['main']['humidity'];
          final windSpeed = weatherData['wind']['speed'];

          return Padding(
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
                                  '${weatherTemp.toString()}`F',

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Icon(
                                  weatherIcon == 'Clouds' ||
                                          weatherIcon == 'Rain'
                                      ? Icons.cloud
                                      : Icons.sunny,
                                  size: 72,
                                ),
                                Text(
                                  weatherIcon,
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
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return weatherCard(
                        time: data['list'][index + 1]['dt'].toString(),
                        temperature: data['list'][index + 1]['main']['temp'],
                        weatherIcon:
                            data['list'][index + 1]['weather'][0]['main'] ==
                                'Rain'
                            ? Icons.cloud
                            : Icons.sunny,
                      );
                    },
                  ),
                ),

                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       for (int i = 0; i < 5; i++)
                //         weatherCard(
                //           time: data['list'][i + 1]['dt'].toString(),
                //           temperature: data['list'][i + 1]['main']['temp'],
                //           weatherIcon:
                //               data['list'][i + 1]['weather'][0]['main'] ==
                //                   'Rain'
                //               ? Icons.cloud
                //               : Icons.sunny,
                //         ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 4, bottom: 8),
                  child: heading('Additional Information'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      detailCard(
                        Icons.water_drop,
                        'Humidity',
                        humidity.toString(),
                      ),
                      detailCard(
                        Icons.speed,
                        'WindSpeed',
                        windSpeed.toString(),
                      ),
                      detailCard(
                        Icons.umbrella_rounded,
                        'Pressure',
                        pressure.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
