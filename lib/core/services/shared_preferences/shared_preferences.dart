
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// helper class for store and read simple data from SharedPreferences
class SharedPreferencesHelper {
  static final String _kAuth = 'Auth';



  Future<SharedPreferences> get _getSharedPreferences async =>
      await SharedPreferences.getInstance();



}
