

import 'package:contact_book/core/data/models/user.dart';
import 'package:contact_book/core/locator.dart';
import 'package:contact_book/core/services/shared_preferences/shared_preferences.dart';

class AuthRepository {
  SharedPreferencesHelper _sp = locator<SharedPreferencesHelper>();

  UserModel? _auth;
  UserModel? get auth => _auth;
  set setAuth(UserModel auth) {
    _auth = auth;
  }

  bool get isAuthenticated => _auth != null;

  Future signIn(UserModel user) async {
    _auth = user;
    _sp.setAuth(user: user);
  }

  Future signOut() async {
    await _sp.removeAuth();
  }

  Future getUser() async {
    _auth = await _sp.getAuth();
  }

}
