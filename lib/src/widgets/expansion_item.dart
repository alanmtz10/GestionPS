import 'package:flutter/material.dart';

enum EstadoProduto { ENVIADO, CANCELADO, ENTREGADO }

class ExpansionItem extends StatelessWidget {
  final EstadoProduto estado;

  const ExpansionItem(
      {Key key, EstadoProduto this.estado = EstadoProduto.ENVIADO})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(5),
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              getEstado(),
              Column(
                children: <Widget>[
                  Text(
                    "4 Productos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("27/May/20")
                ],
              ),
              Column(
                children: <Widget>[Text("\$4500")],
              )
            ],
          ),
          children: <Widget>[
            Text("Detalle del pedido:"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Producto 1"),
                Text("Numero de items"),
                Text("\$4000")
              ],
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  Column getEstado() {
    Color color = Colors.green;
    String estado = "Entregado";

    if (this.estado == EstadoProduto.ENVIADO) {
      color = Colors.lightBlue;
      estado = "Enviado";
    } else if (this.estado == EstadoProduto.CANCELADO) {
      color = Colors.redAccent;
      estado = "Cancelado";
    }

    return Column(
      children: <Widget>[
        Icon(Icons.person, color: color),
        Text(
          estado,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
