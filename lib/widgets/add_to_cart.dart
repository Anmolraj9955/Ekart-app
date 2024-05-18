import 'package:anmolapp/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../models/catalog.dart';

class addtocart extends StatefulWidget {
  final Item catalog;
  const addtocart({
    super.key,
    required this.catalog,
  });

  @override
  State<addtocart> createState() => _addtocartState();
}

class _addtocartState extends State<addtocart> {
bool isincart = false;
  

  @override
  Widget build(BuildContext context) {
    // bool isincart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isincart) {
          isincart = isincart.toggle();
          final _catalog = CatalogModel();
          final _cart = cartmodel();

          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        }
        
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkbluish),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isincart ? Icon(Icons.done) : "ADD TO CART".text.make(),
    );
  }
}
