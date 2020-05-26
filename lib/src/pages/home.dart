import 'package:GestionPS/src/helpers/screen.dart';
import 'package:GestionPS/src/helpers/theme.dart';
import 'package:GestionPS/src/widgets/base_scaffold.dart';
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
    return BaseScaffold(
      widgets: <Widget>[
        Container(
          width: DeviceScreen.getWidth(context),
          padding: EdgeInsets.only(left: 5, top: 20),
          child: Text(
            "Accesos rápidos:",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15),
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
                backgroundColor: GPSColors.primary[500],
              ),
              CardHeader(
                desc: "Pagos",
                urlImage: "assets/img/payment.png",
                backgroundColor: GPSColors.secondary[500],
              ),
              CardHeader(
                desc: "Ofertas",
                urlImage: "assets/img/sales.png",
                backgroundColor: GPSColors.primary[500],
              ),
              SizedBox(width: 5)
            ],
          ),
        ),
        Container(
          width: DeviceScreen.getWidth(context),
          padding: EdgeInsets.only(left: 5, top: 10),
          child: Text(
            "Marcas:",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15),
          ),
        ),
        Expanded(
          child: GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: <Widget>[
              Container(
                height: 350,
                color: Colors.red,
              ),
              Container(
                height: 350,
                color: Colors.blue,
              ),
              Container(
                height: 200,
                color: Colors.blue,
              ),
              Container(
                height: 200,
                color: Colors.blue,
              ),
              Container(
                height: 200,
                color: Colors.blue,
              ),
            ],
          ),
        )
      ],
    );
  }
}
