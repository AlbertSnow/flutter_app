import 'package:shared_preferences/shared_preferences.dart';

class MyPreference {

  static final MyPreference instance = new MyPreference();

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

}
