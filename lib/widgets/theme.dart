import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepOrange,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamcolor,
      bottomAppBarTheme: BottomAppBarTheme(color: Color.fromARGB(255, 31, 67, 108)),
      secondaryHeaderColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
      ));

  static ThemeData DarkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
      primarySwatch: Colors.deepOrange,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkcream,
      secondaryHeaderColor: Colors.white,
      bottomAppBarTheme: BottomAppBarTheme(color: Color.fromARGB(255, 44, 84, 196)),
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
      ));
  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkcream = Vx.gray800;
  static Color darkbluish = Color(0xff403b58);
  static Color lightbluish = Vx.indigo500;
}
