import "package:flutter/material.dart";

Column detailCard(IconData icon, String weather, String temp) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(icon, size: 42),
      Text(weather, style: TextStyle(fontSize: 16)),
      Text(temp, style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  );
}
