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
                      "Authenticated username",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      backgroundColor: GPSColors.tertiary,
                    ),
                  ],
                )
              ],
            )),
      ),
      preferredSize: Size(DeviceScreen.getWidth(contexta), 100),
    );
  }
}
