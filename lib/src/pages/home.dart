import 'package:flutter/material.dart';

import 'package:GestionPS/src/helpers/screen.dart';
import 'package:GestionPS/src/helpers/theme.dart';
import 'package:GestionPS/src/widgets/card_header.dart';
import 'package:GestionPS/src/widgets/card_image.dart';

import '../widgets/common_widgets.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: CommonWidgets.getAppBar(context, scaffoldKey: key),
      drawer: CommonWidgets.getDrawer(context),
      body: SingleChildScrollView(
        child: Container(
          height: DeviceScreen.getHeight(context) - 100,
          width: DeviceScreen.getWidth(context),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
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
                      desc: "Pedidos",
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
                  "Ver catalogos:",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: <Widget>[
                    CardImage(
                      marca: "Avon",
                      image: "assets/img/avon.jpg",
                    ),
                    CardImage(
                      marca: "Jafra",
                      image: "assets/img/jafra.jpg",
                    ),
                    CardImage(
                      marca: "Natura",
                      image: "assets/img/natura.jpg",
                    ),
                    CardImage(
                      marca: "Price Shoes",
                      image: "assets/img/priceShoes.jpg",
                    ),
                    CardImage(
                      marca: "TupperWare",
                      image: "assets/img/tupperWare.jpg",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
