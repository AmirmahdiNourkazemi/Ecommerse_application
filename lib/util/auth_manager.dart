import 'package:flutter/material.dart';
import 'package:mobile_shop/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMnager {
  static final ValueNotifier<String?> authChangeNotifier = ValueNotifier(null);
  static final SharedPreferences _sharedPreferences = locator.get();
  static void saveToken(String token) async {
    _sharedPreferences.setString('access_token', token);
    authChangeNotifier.value = token;
  }

  static String readAuth() {
    return _sharedPreferences.getString('access_token') ?? '';
  }

  static void logout() {
    _sharedPreferences.clear();
    authChangeNotifier.value = null;
  }

  static bool isLogin() {
    String token = readAuth();
    return token.isNotEmpty; //true
  }
}
