

import 'package:contact_book/core/data/repositories/authentication.dart';
import 'package:contact_book/core/data/repositories/contacts.dart';
import 'package:contact_book/core/services/api/api_service.dart';
import 'package:contact_book/core/services/shared_preferences/shared_preferences.dart';
import 'package:contact_book/core/viewmodels/auth.dart';
import 'package:contact_book/core/viewmodels/contacts.dart';
import 'package:contact_book/core/viewmodels/splash.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;
// final sharedPreferences = SharedPreferencesHelper.getInstance();
// final apiService = ApiService.getInstance(
//   preferencesHelper: sharedPreferences,
//   logger: true,
// );

void setupLocator() {
  //services
  locator.registerLazySingleton(() => ApiService(locator(), logger: true));
  locator.registerLazySingleton(() => SharedPreferencesHelper());
  

  //repoitories
  locator.registerLazySingleton(() => AuthRepository());
  locator.registerLazySingleton(() => ContactsRepository());


  //view models
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => AuthViewModel());
  locator.registerFactory(() => ContactsViewModel());
}

resetLocator() async {
  //services
  await locator.resetLazySingleton<ApiService>(
      instance: locator.get<ApiService>());
  await locator.resetLazySingleton<SharedPreferencesHelper>(
      instance: locator.get<SharedPreferencesHelper>());

}
