import 'package:anmolapp/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Welcome to Shopkart".text.xl4.bold.color(Colors.black).make(),
      "trending items".text.xl2.make(),
    ]);
  }
}