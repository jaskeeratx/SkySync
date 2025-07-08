import 'package:flutter/material.dart';

SizedBox weatherCard(String time, double temperature) {
  return SizedBox(
    width: 100,
    child: Card(
      elevation: 24,
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
          Icon(Icons.cloud, size: 64),
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
  );
}
