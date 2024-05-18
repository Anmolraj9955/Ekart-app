import 'package:anmolapp/models/cart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.xl3.make(),
      ),
      body: Column(children: [
        // placeholder check the screen pad by showing a line box
        // Placeholder().p16().expand(),
        Expanded(child: _cartlist().p8()),
        Divider(),
        Expanded(child: _carttotal()),
      ]),
    );
  }
}

class _carttotal extends StatelessWidget {
  final _cart = cartmodel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalprice}".text.bold.xl3.color(Colors.black).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "ORDER PLACED".text.make()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    context.theme.bottomAppBarTheme.color)),
            child: "BUY".text.xl2.bold.white.make(),
          )
        ],
      ),
    );
  }
}

class _cartlist extends StatefulWidget {
  const _cartlist({super.key});

  @override
  State<_cartlist> createState() => _cartlistState();
}

class _cartlistState extends State<_cartlist> {
  final _cart = cartmodel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "NOTHING TO SHOW".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, Index) => ListTile(
                  leading: Icon(
                    Icons.done,
                    size: 50,
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.remove_circle_outline,
                      size: 30,
                    ),
                    onPressed: () {
                      _cart.remove(_cart.items[Index]);
                      setState(() {});
                    },
                  ),
                  title: _cart.items[Index].name.text.xl3.make(),
                ));
  }
}
