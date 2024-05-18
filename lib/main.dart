import 'package:anmolapp/core/store.dart';
import 'package:anmolapp/pages/cart_page.dart';
import 'package:anmolapp/pages/homepage.dart';
import 'package:anmolapp/pages/loginpage.dart';
import 'package:anmolapp/utiles/routes.dart';
import 'package:anmolapp/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: MyTheme.DarkTheme(context),
      theme: MyTheme.LightTheme(context),
      // initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartroute:(context) => CartPage(),
      },
      // home: LoginPage()
    );
  }
}
