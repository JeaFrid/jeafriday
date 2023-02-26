import 'package:flutter/material.dart';
import 'package:jeafriday/jeacolor.dart';
import 'package:jeafriday/jeafire.dart';
import 'package:jeafriday/jearandom.dart';

void main() {
  runApp(const JeaFridayApp());
}

class JeaFridayApp extends StatelessWidget {
  const JeaFridayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JeaFriday Test',
      home: Column(
        children: [
          //JeaFriday: JeaColor => hextoRgb example.
          Text(JeaColor.hextoRgb("#ffffff")),
          //JeaFriday: JeaRandom => string example.
          Text(JeaRandom.string(10).toString()),
          //JeaFriday: JeaRandom => integer example.
          Text(JeaRandom.integer(10).toString()),
          //JeaFriday: JeaFire => login example.
          TextButton(
              onPressed: () => JeaFire.login("example@gmail.com", "123456789"),
              child: Text("Firebase auth login.")),
          //JeaFriday: JeaFire => register example.
          TextButton(
              onPressed: () => JeaFire.register(
                  "example@gmail.com", "123456789", ["JeaFriday"]),
              child: Text("Firebase auth register.")),
          //JeaFriday: JeaFire => register example.
          TextButton(
              onPressed: () => JeaFire.getOnce("reference"), // return List;
              child: Text("Firebase database get once data.")),
        ],
      ),
    );
  }
}
