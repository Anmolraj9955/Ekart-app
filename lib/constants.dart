import 'package:flutter/material.dart';

Text text(
    {String text = "",
    double size = 12,
    Color color = Colors.black,
    FontWeight bold = FontWeight.normal,
    FontStyle? style}) {
  return Text(text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: bold,
        fontStyle: style,
      ));
}
