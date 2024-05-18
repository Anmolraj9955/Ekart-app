// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
     const imgurl =
        "https://e7.pngegg.com/pngimages/564/785/png-clipart-dave-the-minion-minions-stuart-the-minion-standee-minion-large-cartoon-minion-poster-cartoons-thumbnail.png";
    return Drawer(
      child: Container(
      color: Colors.deepPurple,
      child: ListView(
        children: [
           DrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Anmol raj"),
              accountEmail: Text("rajanmol588@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imgurl),
              ), 
            ),
          ),   
          const ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text(
              "mail",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text(
              "profile",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
