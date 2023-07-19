import 'package:flutter/material.dart';

extension ColorParsing on String? {
  Color parseToColor() {
    String colorString = 'ff${this}';
    int hexColor = int.parse(colorString, radix: 16);
    return Color(hexColor);
  }
}
