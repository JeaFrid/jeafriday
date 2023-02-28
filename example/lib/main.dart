import 'package:flutter/material.dart';
import 'package:jeafriday/jeacolor.dart';
import 'package:jeafriday/jeafire.dart';
import 'package:jeafriday/jeafwidget.dart';
import 'package:jeafriday/jearandom.dart';
import 'package:jeafriday/jeasync.dart';

void main() {
  runApp(const JeaFridayApp());
}

class JeaFridayApp extends StatelessWidget {
  const JeaFridayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JeaFriday Test',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //JeaFriday: JeaColor => hextoRgb example.
                JeaText(
                  marginAll: 10,
                  selectable: false,
                  text: JeaColor.hextoRgb("#ffffff"),
                  textColor: Colors.white,
                ),

                //JeaFriday: JeaRandom => string example.
                JeaText(
                  marginAll: 10,
                  text: JeaRandom.string(10).toString(),
                  textColor: Colors.white,
                ),
                //JeaFriday: JeaRandom => integer example.
                JeaText(
                  marginAll: 10,
                  text: JeaRandom.integer(10).toString(),
                  textColor: Colors.white,
                ),
                JeaImageNetwork(src: "src"),
                //JeaFriday: JeaFire => login example.
                JeaButton(
                  onTap: () => JeaFire.login("example@gmail.com", "123456789"),
                  text: "Firebase auth login.",
                  textColor: Colors.white,
                ),
                //JeaFriday: JeaFire => register example.
                JeaButton(
                  onTap: () => JeaFire.register(
                      "example@gmail.com", "123456789", ["JeaFriday"]),
                  text: "Firebase auth register.",
                  textColor: Colors.white,
                ),
                //JeaFriday: JeaFire => register example.
                JeaButton(
                  onTap: () => JeaFire.getOnce("reference"), // return List;
                  text: "Firebase database get once data.",
                  textColor: Colors.white,
                ),
                JeaTextField(
                    textfieldController: TextEditingController(),
                    labelText: "labelText",
                    type: 1),
                Wrap(
                  children: const [
                    JeaIconTitleText(
                      title: "title",
                      subtitle: "subtitle",
                      icon: Icons.verified,
                      clickable: true,
                    ),
                    JeaIconTitleText(
                      title: "title",
                      subtitle: "subtitle",
                      icon: Icons.verified,
                      clickable: false,
                    ),
                    JeaIconTitleText(
                      title: "title",
                      subtitle: "subtitle",
                      icon: Icons.verified,
                      clickable: false,
                    ),
                    JeaIconTitleText(
                      title: "title",
                      subtitle: "subtitle",
                      icon: Icons.verified,
                      clickable: false,
                    ),
                    JeaIconTitleText(
                      title: "title",
                      subtitle: "subtitle",
                      icon: Icons.verified,
                      clickable: false,
                    ),
                    JeaIconTitleText(
                      title: "title",
                      subtitle: "subtitle",
                      icon: Icons.verified,
                      clickable: false,
                    ),
                    JeaIconTitleText(
                      title: "title",
                      subtitle: "subtitle",
                      icon: Icons.verified,
                      clickable: false,
                    ),
                    JeaIconTitleText(
                      title: "title",
                      subtitle: "subtitle",
                      icon: Icons.verified,
                      clickable: false,
                    ),
                    JeaIconTitleText(
                      title: "title",
                      subtitle: "subtitle",
                      icon: Icons.verified,
                      clickable: false,
                    ),
                    JeaIconTitleText(
                      title: "title",
                      subtitle: "subtitle",
                      icon: Icons.verified,
                      clickable: false,
                    ),
                    JeaIconTitleText(
                      title: "title",
                      subtitle: "subtitle",
                      icon: Icons.verified,
                      clickable: false,
                    ),
                    JeaIconTitleText(
                      title: "title",
                      subtitle: "subtitle",
                      icon: Icons.verified,
                      clickable: false,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
