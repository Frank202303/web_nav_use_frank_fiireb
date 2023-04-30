import 'package:shared_preferences/shared_preferences.dart';

enum UserInfo {
  accessToken,
  client,
  tokenType,
  expiry,
  uid,
  subscriptionType,
  firstName,
  lastName,

  /// deep link or notification was opened
  wasOpened,
}

class UserDefaults {
  static UserDefaults instance = UserDefaults();

  static String userInfoKeyValue(UserInfo infoKey) {
    switch (infoKey) {
      case UserInfo.accessToken:
        return 'access-token';
      case UserInfo.client:
        return 'client';
      case UserInfo.tokenType:
        return 'token-type';
      case UserInfo.expiry:
        return 'expiry';
      case UserInfo.uid:
        return 'uid';
      case UserInfo.subscriptionType:
        return 'subscription_type';
      case UserInfo.firstName:
        return 'first_name';
      case UserInfo.lastName:
        return 'last_name';
      case UserInfo.wasOpened:
        return 'was_opened';
    }
  }

  /// Incoming parameters: key and value
  /// save data locally
  Future setStringBy(UserInfo key, {String? value}) async {
    return setString(userInfoKeyValue(key), value);
  }

  Future setString(String key, String? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value != null) {
      prefs.setString(key, value);
    } else {
      prefs.setString(key, "");
    }
  }

  Future setIntBy(UserInfo key, {int? value}) async {
    return setInt(userInfoKeyValue(key), value);
  }

  Future setInt(String key, int? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value != null) {
      prefs.setInt(key, value);
    } else {
      prefs.setInt(key, 0);
    }
  }

  Future setDoubleBy(UserInfo key, {double? value}) async {
    return setDouble(userInfoKeyValue(key), value);
  }

  Future setDouble(String key, double? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value != null) {
      prefs.setDouble(key, value);
    } else {
      prefs.setDouble(key, 0.0);
    }
  }

  Future setBoolBy(UserInfo key, {bool? value}) async {
    return setBool(userInfoKeyValue(key), value);
  }

  Future setBool(String key, bool? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value != null) {
      prefs.setBool(key, value);
    } else {
      prefs.setBool(key, false);
    }
  }

  Future setStringListBy(UserInfo key, {List<String>? value}) async {
    return setStringList(userInfoKeyValue(key), value);
  }

  Future setStringList(String key, List<String>? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value != null) {
      prefs.setStringList(key, value);
    } else {
      prefs.setStringList(key, []);
    }
  }

  ///  parameters: key
  /// read local data according key
  Future<String> getStringBy(UserInfo key) async {
    return getString(userInfoKeyValue(key));
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  Future<int> getIntBy(UserInfo key) async {
    return getInt(userInfoKeyValue(key));
  }

  Future<int> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  Future<double> getDoubleBy(UserInfo key) async {
    return getDouble(userInfoKeyValue(key));
  }

  Future<double> getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0;
  }

  Future<bool> getBoolBy(UserInfo key) async {
    return getBool(userInfoKeyValue(key));
  }

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  Future<List<String>> getStringListBy(UserInfo key) async {
    return getStringList(userInfoKeyValue(key));
  }

  Future<List<String>> getStringList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }
}
