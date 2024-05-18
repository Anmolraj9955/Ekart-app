import 'dart:math';

import 'package:anmolapp/models/cart.dart';
import 'package:anmolapp/pages/home_detailpage.dart';
import 'package:anmolapp/widgets/add_to_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../pages/homepage.dart';
import '../theme.dart';
import 'catalog_img.dart';

class Cataloglist extends StatelessWidget {
  const Cataloglist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, Index) {
        final catalog = CatalogModel.items[Index];
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetail(
                            catalog: catalog,
                          )),
                ),
            child: CatalogItem(
              catalog: catalog,
            ));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(children: [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(
          image: catalog.image,
        ),
      ),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.xl.bold.color(MyTheme.darkbluish).make(),
          catalog.desc.text.textStyle(context.captionStyle).make(),
          10.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.xl.bold.make(),
              addtocart(
                catalog: catalog,
              )
            ],
          ).pOnly(right: 8.0)
        ],
      ))
    ])).color(context.cardColor).square(150).rounded.make().py16();
  }
}
