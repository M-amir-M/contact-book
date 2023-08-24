
import 'package:contact_book/core/data/models/user.dart';
import 'package:contact_book/core/data/repositories/authentication.dart';
import 'package:contact_book/core/enums/network_state.dart';
import 'package:contact_book/core/locator.dart';
import 'package:contact_book/core/viewmodels/base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  AuthRepository _authRepository = locator<AuthRepository>();

  UserModel? get auth => _authRepository.auth;

  Future<bool> signIn(UserModel data) async {
    setState(NetworkState.BUSY);
    notifyListeners();

    await _authRepository.signIn(data);

    setState(NetworkState.COMPLETE);
    notifyListeners();

    return true;
  }
}
