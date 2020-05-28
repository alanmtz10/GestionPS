import 'package:GestionPS/src/helpers/screen.dart';
import 'package:GestionPS/src/helpers/theme.dart';
import 'package:GestionPS/src/helpers/util.dart';
import 'package:GestionPS/src/providers/dataProvider.dart';
import 'package:GestionPS/src/widgets/card_image.dart';
import 'package:GestionPS/src/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class Catalogos extends StatelessWidget {
  const Catalogos({Key key}) : super(key: key);

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
          child: FutureBuilder<List>(
            future: getCatalogos(arguments["marca"]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      Util.capitalize(arguments["marca"]),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: GridView.count(
                        padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        children: getItems(snapshot.data, arguments["marca"]),
                      ),
                    )
                  ],
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

  getItems(List data, String marca) {
    List<Widget> items = [];

    for (var item in data) {
      items.add(
        CardImage(
          marca: item["nombre"],
          image: item["image"],
          route: "productos",
          arguments: {
            "marca": marca,
            "catalogo": (item["nombre"] as String).toLowerCase()
          },
        ),
      );
    }

    return items;
  }
}
