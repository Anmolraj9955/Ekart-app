// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anmolapp/widgets/add_to_cart.dart';
import 'package:anmolapp/widgets/catalogwidget/catalog_img.dart';
import 'package:anmolapp/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.xl3.bold.make(),
            
            addtocart(catalog: catalog,).wh(100, 50)
          ],
        ).p32().color(context.cardColor),
      ),
      body: SafeArea(
        bottom: true,
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image),
          ).h40(context),
          Expanded(
              child: VxArc(
            height: 30,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color: context.cardColor,
              width: context.screenWidth,
              child: Column(
                children: [
                  catalog.name.text.xl4.bold.color(context.accentColor).make(),
                  catalog.desc.text.textStyle(context.captionStyle).bold.lg.make().p8(),
                  10.heightBox,
                  "You can write here all about that product which has shown above".text.xl.bold.textStyle(context.captionStyle).make(),
                ],
              ).py32(),
            ),
          )
          )
        ]),
      ),
    );
  }
}
