import 'dart:convert';
import 'package:anmolapp/utiles/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:anmolapp/models/catalog.dart';
import '../widgets/catalogwidget/cataloglist.dart';
import '../widgets/catalogwidget/header.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int days = 80;
  var url =
      "https://stackoverflow.com/questions/43149055/how-do-i-open-a-web-browser-url-from-my-flutter-code";
  String name = "ghar jayega ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  Future<void> loaddata() async {
    final CatalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeddata = jsonDecode(CatalogJson);
    var productsdata = decodeddata["products"];
    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
    CatalogModel.items = List.from(productsdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});

    //decode- convert from another to string
    //encoded - string to anither
  }

  @override
  Widget build(BuildContext context) {
    // final dummylist = List.generate(5, (index) => CatalogModel.products[0]);
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.cart),
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartroute);
          },
          backgroundColor: context.theme.bottomAppBarTheme.color,
        ),
        body: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                Cataloglist().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),

        // appBar: AppBar(
        //     title: Text(
        //   " ",
        //   style: GoogleFonts.lato(
        //     fontSize: 20,
        //     fontStyle: FontStyle.italic,
        //   ),
        // )),
        // drawer: MyDrawer(),
        // body: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        //       ? GridView.builder(
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               mainAxisSpacing: 16,
        //               crossAxisSpacing: 16

        //               ),
        //           itemBuilder: (context, index) {
        //             final item = CatalogModel.items[index];
        //             return Card(
        //               clipBehavior: Clip.antiAlias,
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(10)
        //                 ),
        //               child: InkWell(
        //                 onTap: () {
        //                   launchUrl(Uri.parse(url));
        //                   print(index);
        //                 },
        //                 child: GridTile(
        //                   header: Container(
        //                     child: Text(
        //                       item.name,
        //                       style: TextStyle(color: Colors.white),
        //                       ),
        //                       padding: EdgeInsets.all(12),
        //                       decoration: BoxDecoration(color: Colors.deepPurple),
        //                       ),
        //                   footer:  Container(
        //                     child: Text(
        //                       item.id.toString(),
        //                       style: TextStyle(color: Colors.white),
        //                       ),
        //                       padding: EdgeInsets.all(12),
        //                       decoration: BoxDecoration(color: Colors.black),
        //                       ),
        //                   child: Image.network(item.image,

        //                       fit: BoxFit.fill),
        //                 ),
        //               ),
        //             );
        //           },
        //           itemCount: CatalogModel.items.length,
        //         )
        //       // ListView.builder(
        //       //   itemCount: CatalogModel.items.length,
        //       //   itemBuilder: (BuildContext context, int index) {
        //       //     return ItemWidget(
        //       //       item: CatalogModel.items[index],
        //       //     );
        //       //   },
        //       // )

        //       : Center(
        //           child: CircularProgressIndicator(),
        //         ),
        // )
      ),
    );
  }
}
