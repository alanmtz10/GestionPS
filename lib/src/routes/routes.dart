import 'package:GestionPS/src/pages/register.dart';
import 'package:flutter/material.dart';

import 'package:GestionPS/src/pages/catalogos.dart';
import 'package:GestionPS/src/pages/detalle_producto.dart';
import 'package:GestionPS/src/pages/home.dart';
import 'package:GestionPS/src/pages/pedidos.dart';
import 'package:GestionPS/src/pages/productos.dart';
import 'package:GestionPS/src/pages/sign_in.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      'inicioSesion': (context) => IniciarSesion(),
      'register': (context) => Register(),
      'home': (context) => Home(),
      'pedidos': (context) => Pedidos(),
      'catalogos': (context) => Catalogos(),
      'productos': (context) => Productos(),
      'detalleProducto': (context) => DetalleProducto(),
    };
  }
}
