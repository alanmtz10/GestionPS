import 'package:GestionPS/src/pages/home.dart';
import 'package:GestionPS/src/pages/pedidos.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      'home': (context) => Home(),
      'pedidos': (context) => Pedidos(),
    };
  }
}
