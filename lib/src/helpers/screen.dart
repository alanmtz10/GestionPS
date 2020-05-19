import 'package:flutter/material.dart';

class DeviceScreen {
  static double getWidth(dynamic context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(dynamic context) {
    return MediaQuery.of(context).size.height;
  }
}
