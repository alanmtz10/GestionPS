import 'package:GestionPS/src/helpers/screen.dart';
import 'package:flutter/material.dart';

import 'common_widgets.dart';

class BaseScaffold extends StatefulWidget {
  List<Widget> widgets;

  BaseScaffold({Key key, this.widgets = null}) : super(key: key);

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState(widgets: this.widgets);
}

class _BaseScaffoldState extends State<BaseScaffold> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> widgets;

  _BaseScaffoldState({this.widgets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CommonWidgets.getAppBar(context, scaffoldKey: _scaffoldKey),
      drawer: Drawer(
        elevation: 5,
        child: Center(child: Text("data")),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: DeviceScreen.getHeight(context) - 100,
          width: DeviceScreen.getWidth(context),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: this.widgets,
          ),
        ),
      ),
    );
  }
}
