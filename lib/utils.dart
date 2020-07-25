import 'package:flutter/material.dart';

const Map<String, Color> tmpColors = {
  'red': Colors.red,
  'blue': Colors.blue,
  'white': Colors.white,
  'lightWhite': Colors.white70,
  'black': Colors.black,
};

Color getColorFromName(String name) {
  for (String k in tmpColors.keys) {
    if (name == k)
      return tmpColors[k];
  }
  return Colors.black;
}


extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}