import 'package:GestionPS/src/helpers/theme.dart';
import 'package:GestionPS/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPS',
      theme: ThemeData(
        primaryColor: GPSColors.primary,
        accentColor: GPSColors.secondary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: Routes.getRoutes(),
      initialRoute: "home",
    );
  }
}
