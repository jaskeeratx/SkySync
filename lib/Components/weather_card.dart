import 'package:flutter/material.dart';

Card weatherCard(String time, double temperature) {
  return Card(
    child: Column(
      children: [
        Text(
          time,

          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(Icons.cloud, size: 72),
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
  );
}
