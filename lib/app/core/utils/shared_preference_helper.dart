import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // key
  static const String fistUsed = 'fist_use';
  static const String authToken = "auth_token";
  static const String email = "email";
  static const String password = "password";

  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // fist used
  bool get getIsFist {
    return _sharedPreference.getBool(SharedPreferenceHelper.fistUsed) ?? true;
  }

  Future<void> setIsFist(bool isFirst) {
    return _sharedPreference.setBool(SharedPreferenceHelper.fistUsed, isFirst);
  }

  // token
  String get getAuthToken {
    return _sharedPreference.getString(SharedPreferenceHelper.authToken) ?? '';
  }

  Future<void> setAuthToken(String authToken) {
    return _sharedPreference.setString(
        SharedPreferenceHelper.authToken, authToken);
  }

  // email
  String get getEmail {
    return _sharedPreference.getString(SharedPreferenceHelper.email) ?? '';
  }

  Future<void> setEmail(String email) {
    return _sharedPreference.setString(
        SharedPreferenceHelper.email, email);
  }

  // password
  String get getPassword {
    return _sharedPreference.getString(SharedPreferenceHelper.password) ?? '';
  }

  Future<void> setPassword(String password) {
    return _sharedPreference.setString(
        SharedPreferenceHelper.password, password);
  }
}
