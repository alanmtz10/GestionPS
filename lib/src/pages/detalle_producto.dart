import 'package:GestionPS/src/helpers/screen.dart';

import 'package:GestionPS/src/widgets/common_widgets.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
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
          child: FutureBuilder<PDFDocument>(
              future: getPDF(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return PDFViewer(document: snapshot.data);
                }
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }

  Future<PDFDocument> getPDF() async {
    PDFDocument doc = await PDFDocument.fromAsset(
      "assets/TheLookMayoJunio2020.pdf",
    );

    return doc;
  }
}
