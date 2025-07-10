import 'package:flutter/material.dart';

SizedBox weatherCard({
  required String time,
  required double temperature,
  required IconData weatherIcon,
}) {
  return SizedBox(
    width: 100,
    child: Card(
      elevation: 24,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              time,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(weatherIcon, size: 32),
            ),
            Text(
              " ${temperature}F",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
