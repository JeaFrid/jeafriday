import 'package:flutter/material.dart';
import 'package:jeafriday/jeafriday.dart';
import 'package:jeafriday/jeafwidget.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: JeaButton(
          text: "Back",
          onTap: () => JeaFriday.back(context),
        ),
      ),
    );
  }
}
