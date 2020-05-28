import 'package:GestionPS/src/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';

class Pedidos extends StatelessWidget {
  const Pedidos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      widgets: <Widget>[
        Table(
          children: <TableRow>[
            TableRow(
              children: [
                Icon(Icons.import_export),
              ],
            )
          ],
        )
      ],
    );
  }
}
