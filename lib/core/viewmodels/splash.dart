
import 'package:contact_book/core/data/repositories/authentication.dart';
import 'package:contact_book/core/locator.dart';
import 'package:contact_book/core/routes/route_path.dart';
import 'package:contact_book/core/viewmodels/base_view_model.dart';
import 'package:get/get.dart';
class SplashViewModel extends BaseViewModel {
  final AuthRepository _authRepo = locator<AuthRepository>();
  // SharedPreferencesHelper _sp = locator<SharedPreferencesHelper>();

  Future getConfiguration() async {
    await _authRepo.getUser();
    await Future.delayed(4.seconds);
    if (_authRepo.isAuthenticated) {
      await Get.offNamed(RoutePath.contactList);
    } else {
      await Get.offNamed(RoutePath.signIn);
    }
  }
}
