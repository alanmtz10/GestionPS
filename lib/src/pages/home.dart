import 'package:GestionPS/src/helpers/screen.dart';
import 'package:GestionPS/src/helpers/theme.dart';
import 'package:GestionPS/src/widgets/card_header.dart';
import 'package:GestionPS/src/widgets/common_widgets.dart';
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
      appBar: CommonWidgets.getAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          width: DeviceScreen.getWidth(context),
          child: Column(
            children: <Widget>[
              Container(
                width: DeviceScreen.getWidth(context),
                padding: EdgeInsets.only(left: 5, top: 20),
                child: Text(
                  "Accesos rápidos:",
                  textAlign: TextAlign.left,
						style: TextStyle(
							fontSize: 15
						),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 180,
                child: ListView(
                  padding: EdgeInsets.only(bottom: 10),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CardHeader(
                      desc: "Mis pedidos",
                      urlImage: "assets/img/icon.png",
                    ),
                    CardHeader(
                      desc: "Pagos",
                      urlImage: "assets/img/payment.png",
                      backgroundColor: GPSColors.secondary,
                    ),
						  CardHeader(
                      desc: "Ofertas",
                      urlImage: "assets/img/sales.png",
                      backgroundColor: GPSColors.primary,
                    ),
                    SizedBox(width: 5)
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
