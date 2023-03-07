import 'package:shared_preferences/shared_preferences.dart';

class JeaDB {
  ///Using [SharedPreferences], it saves the value given to the
  ///</br>local database as String. If you are going to send a list,
  ///</br>convert the list to an encrypted String using [JeaFire.encode]
  ///</br>and then save the data using this function. Use [get]
  ///</br>to retrieve data. If you sent encrypted data, decrypt it using [JeaFire.decode].
  static Future<void> set(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  ///Call a String value you sent with [get] via key.
  static Future<String> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key)!;
  }

  ///Get all the keys.
  static Future<Set<String>> getKeys() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getKeys();
  }

  ///Remove all the keys.
  static Future<bool> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  ///Remove specific the key.
  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
