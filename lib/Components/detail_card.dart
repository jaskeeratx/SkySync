import "package:flutter/material.dart";

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
