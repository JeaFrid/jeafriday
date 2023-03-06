import 'dart:math';

class JeaRandom {
  ///Generate a random String value.
  static String string(int length) {
    final List abc = [
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "i",
      "j",
      "k",
      "l",
      "m",
      "n",
      "o",
      "p",
      "r",
      "s",
      "t",
      "u",
      "v",
      "y",
      "x",
      "w",
      "z",
    ];
    String result = "";
    for (var i = 0; i < length; i++) {
      result = result + abc[Random().nextInt(abc.length)];
    }
    return result;
  }

  ///Generate a random Integer value.
  static int integer(int length) {
    return Random().nextInt(length);
  }

  ///Generate a random Email value.
  static String email() {
    return "${JeaRandom.string(15)}@gmail.com";
  }

  ///Generate a random Password value.
  static String password() {
    return "${JeaRandom.string(1).toUpperCase()}${JeaRandom.string(3).toLowerCase()}${JeaRandom.integer(2000)}${JeaRandom.string(4).toLowerCase()}${JeaRandom.string(3).toUpperCase()}${JeaRandom.integer(99)}${JeaRandom.string(4).toLowerCase()}${JeaRandom.string(1).toUpperCase()}${JeaRandom.string(3).toLowerCase()}${JeaRandom.integer(2000)}${JeaRandom.string(4).toLowerCase()}${JeaRandom.string(3).toUpperCase()}${JeaRandom.integer(99)}${JeaRandom.string(4).toLowerCase()}";
  }
}
