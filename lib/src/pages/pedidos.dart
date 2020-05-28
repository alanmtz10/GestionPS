import 'package:flutter/material.dart';
import 'package:GestionPS/src/widgets/expansion_item.dart';
import '../helpers/screen.dart';
import '../widgets/common_widgets.dart';

class Pedidos extends StatelessWidget {
  const Pedidos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keys = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: keys,
      appBar: CommonWidgets.getAppBar(context, scaffoldKey: keys),
      drawer: CommonWidgets.getDrawer(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          height: DeviceScreen.getHeight(context) - 100,
          width: DeviceScreen.getWidth(context),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Pedidos",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: ListView(
                  children: <Widget>[
                    ExpansionItem(),
                    ExpansionItem(
                      estado: EstadoProduto.ENTREGADO,
                    ),
                    ExpansionItem(
                      estado: EstadoProduto.CANCELADO,
                    ),
                    ExpansionItem(),
                    ExpansionItem(),
                    ExpansionItem(),
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
