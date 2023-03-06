library jeafriday;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class JeaFriday {
  ///Switches from the current screen to the target screen.
  static void to(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  ///Close this screen and return to the previous screen.
  static void back(BuildContext context) {
    Navigator.pop(context);
  }

  ///Opens a new screen with RouteName. You need to specify 'routes' from within the [MaterialApp] widget for it to work.
  static void go(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///Closes all screens and opens a new screen with RouteName. You need to specify 'routes' from within the [MaterialApp] widget for it to work.
  static void allCloseAndGo(BuildContext context, String routeName) {
    Navigator.popAndPushNamed(context, routeName);
  }

  ///GetRequest the given link and return the content.
  static dynamic getRequestContent(String url) async {
    final content = await Dio().get(url);
    return content.statusCode == 200
        ? content.data
        : content.statusCode.toString();
  }

  ///GetRequest the given link and return the headers.
  static dynamic getRequestHeaders(String url) async {
    final content = await Dio().get(url);
    return content.statusCode == 200
        ? content.headers
        : content.statusCode.toString();
  }

  ///GetRequest the given link and return the extras.
  static dynamic getRequestExtra(String url) async {
    final content = await Dio().get(url);
    return content.statusCode == 200
        ? content.extra
        : content.statusCode.toString();
  }

  ///Define this function for the desired context when
  ///</br>making screen changes with the [JeaFriday] class.
  ///</br>In the navigatorKey part, give the variable that defines
  ///</br>the [JeaFriday.navigatorKey] function. Please make sure the same
  ///</br>variable is also in the [MaterialApp] widget.
  static BuildContext navigatorKeyContext(
      GlobalKey<NavigatorState> navigatorKey) {
    return navigatorKey.currentState!.context;
  }

  ///It acts as a constructor for the navigatorKey
  ///</br>property of the [MaterialApp] widget. If you
  ///</br>are going to make screen changes using the [JeaFriday]
  ///</br>class, assign this function to a variable and define the
  ///</br>variable in the navigatorKey property of the [MaterialApp] widget.
  static GlobalKey<NavigatorState> navigatorKey() {
    return GlobalKey<NavigatorState>();
  }
}
