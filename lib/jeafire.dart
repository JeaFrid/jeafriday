import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class JeaFire {
  static Future<String> storeValue(
      String reference, String tag, List valueList) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref(reference);
      String val = JeaFire.encode(valueList);
      await ref.child('"$tag"').set(val);
      return "successful";
    } catch (e) {
      return "error: ${e.toString()}";
    }
  }

  static Future<List> getOnce(String reference) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(reference);
    DataSnapshot snapshot = await ref.get();

    Map mapX = snapshot.value as Map;
    List retVal = [];
    for (var i = 0; i < mapX.keys.length; i++) {
      retVal.add(JeaFire.decodeAndTagAddEndElement(
          mapX.keys.elementAt(i), mapX.values.elementAt(i)));
    }
    return retVal;
  }

  ///It pulls data from Firebase Realtime Database.
  ///<br>Data must be pulled with a password provided by JeaFire.
  ///<br>If you try to pull a different data, an error may occur.

  ///Encrypts the list with a key and converts it to String format.<br>You can store it as a String.
  ///!feValueIndex!
  ///The list has been converted to a String format. Use this to decode: [decode].
  static String encode(List value) {
    String feValue = "";
    for (var count = 0; count < value.length; count++) {
      feValue = "$feValue~~!feValueIndex!~~${value[count]}";
    }
    return feValue;
  }

  ///Decode an encrypted String type data with [encode].
  static List decode(String value) {
    return value.split("~~!feValueIndex!~~");
  }

  ///Decode a String type data encrypted with [encode] and give the tag to the final index.
  static List decodeAndTagAddEndElement(String key, String value) {
    List sendValue = value.split("~~!feValueIndex!~~");
    sendValue.add(key);
    return sendValue;
  }

  ///You can use this function for a quick recording.
  ///</br>It registers using "FirebaseAuth.instance.createUserWithEmailAndPassword()"
  ///</br>and sends the [userDatas] list to the users reference of the Realtime Database
  ///</br>using the "user.user!.uid" tag.
  static Future<List> register(
      String email, String password, List userDatas) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await JeaFire.storeValue("users", user.user!.uid, userDatas);
      return [1.toString(), user.user.toString()];
    } catch (e) {
      return [0.toString(), e.toString()];
    }
  }

  ///Sign in with Firebase Auth. When the login is successful,
  ///</br>the first item of the returned list is 1. If it fails, it returns 0.
  ///</br>In case of success, the second item will be user.user. On failure,
  ///</br>the second item of the list returns an error message.
  static Future<List> login(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      var user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return [1, user.user];
    } catch (e) {
      return [0, e.toString()];
    }
  }

  ///Logs out of Firebase Auth.
  static logout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
  }

  ///If the user is logged in, you can request the UID using this function.
  static Future<String> getUID() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    return uid;
  }

  ///Queries whether Firebase Auth is logged in.
  static bool isSignedIn() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  ///Retrieves the reference from the Firebase Realtime Database.
  ///</br>If 'fevalue' is true, it [decode]s the incoming data and returns
  ///</br>the data in list type. If not, it returns the data directly.
  static Future<dynamic> get(String reference, bool fevalue) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(reference);
    DataSnapshot snapshot = await ref.get();
    if (fevalue == true) {
      return JeaFire.decode(snapshot.value.toString());
    } else {
      return snapshot;
    }
  }

  ///It finds the user in the 'users' reference from the
  ///</br>Firebase Realtime Database and returns its information
  ///</br>as a list. In order for this function to work successfully,
  ///</br>the user must be registered with [register].
  static Future<List> getProfile() async {
    if (JeaFire.isSignedIn()) {
      FirebaseAuth auth = FirebaseAuth.instance;
      String getUid = auth.currentUser!.uid;
      DatabaseReference ref = FirebaseDatabase.instance.ref("users");
      DataSnapshot snapshot = await ref.get();
      Map mapX = snapshot.value as Map;
      String user = "";
      List mapList = mapX.keys.toList();

      for (var i = 0; i < mapList.length; i++) {
        if (mapList[i].toString().contains(getUid)) {
          user = mapList[i];
        }
      }
      DatabaseReference refer = FirebaseDatabase.instance.ref("users/$user");
      DataSnapshot snapval = await refer.get();

      return JeaFire.decode(snapval.value.toString());
    } else {
      return [];
    }
  }
}
