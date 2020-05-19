import 'package:GestionPS/src/helpers/screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.bars,
                    semanticLabel: "Menu",
                  ),
                  Row(
                    children: <Widget>[
                      Text("Authenticated username"),
                      SizedBox(width: 5),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                      ),
                    ],
                  )
                ],
              )),
        ),
        preferredSize: Size(DeviceScreen.getWidth(context), 100),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: DeviceScreen.getWidth(context),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 180,
                child: ListView(
                  padding: EdgeInsets.only(bottom: 10),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.only(left: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
