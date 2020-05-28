import 'package:GestionPS/src/pages/catalogos.dart';
import 'package:GestionPS/src/pages/detalle_producto.dart';
import 'package:GestionPS/src/pages/home.dart';
import 'package:GestionPS/src/pages/pedidos.dart';
import 'package:GestionPS/src/pages/productos.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      'home': (context) => Home(),
      'pedidos': (context) => Pedidos(),
      'catalogos': (context) => Catalogos(),
      'productos': (context) => Productos(),
      'detalleProducto': (context) => DetalleProducto(),
    };
  }
}
