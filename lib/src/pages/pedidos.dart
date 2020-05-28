import 'package:flutter/material.dart';

import '../helpers/screen.dart';
import '../widgets/common_widgets.dart';

class Pedidos extends StatelessWidget {
  const Pedidos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.getAppBar(context),
      drawer: CommonWidgets.getDrawer(),
      body: SingleChildScrollView(
        child: Container(
          height: DeviceScreen.getHeight(context) - 100,
          width: DeviceScreen.getWidth(context),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[Text("Pantalla de pedidos")],
          ),
        ),
      ),
    );
  }
}
