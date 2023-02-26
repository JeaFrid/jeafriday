import 'package:flutter/material.dart';

class JeaRoute {
  static to(Widget page, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
