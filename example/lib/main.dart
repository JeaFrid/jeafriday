import 'package:flutter/material.dart';
import 'package:jeafriday/jeacolor.dart';
import 'package:jeafriday/jeadb.dart';
import 'package:jeafriday/jeafire.dart';
import 'package:jeafriday/jeafriday.dart';
import 'package:jeafriday/jeafwidget.dart';
import 'package:jeafriday/jearandom.dart';

void main() {
  runApp(const JeaFridayApp());
}

class JeaFridayApp extends StatefulWidget {
  const JeaFridayApp({Key? key}) : super(key: key);

  @override
  State<JeaFridayApp> createState() => _JeaFridayAppState();
}

final navKey = JeaFriday.navigatorKey();
final controller = TextEditingController();
String getStringValue = "";

class _JeaFridayAppState extends State<JeaFridayApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JeaFriday Test',
      navigatorKey: navKey,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: JeaVerticalScrollView(
            child: Column(
              children: [
                JeaHorizontalScrollView(
                  child: Row(
                    children: [containers()],
                  ),
                ),
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
                //JeaFriday: JeaDB => got value example.
                JeaText(
                  marginAll: 10,
                  text: getStringValue,
                  textColor: Colors.white,
                ),

                //JeaFriday: JeaFriday (Navigator) => to example.
                JeaButton(
                  onTap: () => JeaFriday.to(
                      JeaFriday.navigatorKeyContext(navKey), const Page1()),
                  text: "Go to Page1",
                  textColor: Colors.white,
                ),
//JeaFriday: JeaDB => set value example.
                JeaButton(
                  onTap: () async {
                    await JeaDB.set("example", controller.text);
                  },
                  text: "set Value",
                  textColor: Colors.white,
                ),
                //JeaFriday: JeaDB => get value example.
                JeaButton(
                  onTap: () async {
                    String localever = await JeaDB.get("example");
                    setState(() {
                      getStringValue = localever;
                    });
                  },
                  text: "get Value",
                  textColor: Colors.white,
                ),
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
                    textfieldController: controller,
                    labelText: "labelText",
                    type: 1),
                JeaHorizontalScrollView(
                  child: iconTitleText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row iconTitleText() {
    return Row(
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
    );
  }

  Row containers() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
