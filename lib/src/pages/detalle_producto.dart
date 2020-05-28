import 'package:GestionPS/src/helpers/screen.dart';
import 'package:GestionPS/src/helpers/theme.dart';
import 'package:GestionPS/src/helpers/util.dart';
import 'package:GestionPS/src/providers/dataProvider.dart';
import 'package:GestionPS/src/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class DetalleProducto extends StatelessWidget {
  const DetalleProducto({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final keys = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: keys,
      appBar: CommonWidgets.getAppBar(context, scaffoldKey: keys),
      drawer: CommonWidgets.getDrawer(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 5, right: 5, top: 10),
          height: DeviceScreen.getHeight(context) - 100,
          width: DeviceScreen.getWidth(context),
          child: FutureBuilder<Map>(
            future: getProducto(arguments["marca"], arguments["catalogo"],
                arguments["id"] as int),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        snapshot.data["nombre"],
                        style: TextStyle(
                          fontSize:
                              snapshot.data["nombre"].length > 20 ? 18 : 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Image.asset(
                        snapshot.data["image"],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "Precio: \$50,000",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Contenido: ${snapshot.data['cont']}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data["desc"],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      getTonos(snapshot.data),
                      FlatButton.icon(
                        color: GPSColors.secondary,
                        textColor: GPSColors.white,
                        onPressed: () {},
                        icon: Icon(Icons.attach_money),
                        label: Text("Comprar"),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget getTonos(Map data) {
    if (data["tonos"] == null) {
      return SizedBox(
        height: 10,
      );
    } else {
      List<Padding> tonos = [];
      for (var tono in data["tonos"]) {
        tonos.add(
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: CircleAvatar(
              backgroundColor: Color(
                int.parse(tono),
              ),
            ),
          ),
        );
      }

      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Tonos: "),
            Row(
              children: tonos,
            )
          ],
        ),
      );
    }
  }
}
