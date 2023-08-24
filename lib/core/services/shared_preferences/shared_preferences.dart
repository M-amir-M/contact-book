
import 'dart:convert';

import 'package:contact_book/core/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// helper class for store and read simple data from SharedPreferences
class SharedPreferencesHelper {
  static final String _kAuth = 'Auth';



  Future<SharedPreferences> get _getSharedPreferences async =>
      await SharedPreferences.getInstance();


  ///setting Auth user to SharedPreferences
  Future<bool> setAuth({required UserModel? user}) async {
    if (user == null) {
      return false;
    }
    final SharedPreferences prefs = await _getSharedPreferences;
    var result = await prefs.setString(_kAuth, jsonEncode(user.toJson()));
    return result;
  }

  ///get Auth user from SharedPreferences
  Future<UserModel?> getAuth() async {
    final SharedPreferences prefs = await _getSharedPreferences;

    String? user = prefs.getString(_kAuth);


    return  user != null ? UserModel.fromJson(jsonDecode(user)) : null;
  }

  ///remove Auth user from SharedPreferences
  Future<bool> removeAuth() async {
    final SharedPreferences prefs = await _getSharedPreferences;
    final result = await prefs.remove(_kAuth);

    return result;
  }

}
