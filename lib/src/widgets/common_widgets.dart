import 'package:GestionPS/src/helpers/screen.dart';
import 'package:GestionPS/src/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonWidgets {
  static Widget getAppBar(contexta, {GlobalKey<ScaffoldState> scaffoldKey}) {
    return PreferredSize(
      child: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 5, right: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Icon(
                    FontAwesomeIcons.bars,
                    size: 30,
                    semanticLabel: "Menu",
                  ),
                  onTap: () {
                    scaffoldKey.currentState.openDrawer();
                  },
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Alan",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/img/avatar.png"),
                    ),
                  ],
                )
              ],
            )),
      ),
      preferredSize: Size(DeviceScreen.getWidth(contexta), 100),
    );
  }

  static Widget getDrawer(contexto) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: GPSColors.primary[500],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(FontAwesomeIcons.home),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Text('Inicio')
              ],
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  contexto, "home", (route) => false);
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(FontAwesomeIcons.signOutAlt),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Text('Cerrar sesión')
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
