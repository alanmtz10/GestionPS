import 'package:flutter/services.dart';
import "dart:convert";

Future<List> getCatalogos(String marca) async {
  String catalogosString =
      await rootBundle.loadString("assets/data/${marca}/catalogos.json");
  List catalogos = json.decode(catalogosString);

  return catalogos;
}

Future<List> getProductos(String marca, String catalogo) async {
  String productosString =
      await rootBundle.loadString("assets/data/${marca}/${catalogo}.json");
  List productos = json.decode(productosString);

  return productos;
}

Future<Map> getProducto(String marca, String catalogo, int id) async {
  List productos = await getProductos(marca, catalogo);

  for (var producto in productos) {
    if ((producto["id"] as int) == id) {
      return producto;
    }
  }

  return null;
}
