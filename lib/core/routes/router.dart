import 'package:contact_book/core/routes/route_path.dart';
import 'package:contact_book/ui/screens/contact_detail.dart';
import 'package:contact_book/ui/screens/contacts.dart';
import 'package:contact_book/ui/screens/new_contact.dart';
import 'package:contact_book/ui/screens/signIn.dart';
import 'package:contact_book/ui/screens/splash.dart';
import 'package:get/get.dart';

class AppRouter {
  AppRouter._();

  static List<GetPage> pages = [
    GetPage(
      name: RoutePath.splashRoute,
      page: () => SplashScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RoutePath.signIn,
      page: () => SignInScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RoutePath.contactList,
      page: () => ContactListPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RoutePath.contactDetail,
      page: () => ContactDetailPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RoutePath.editNewCntact,
      page: () => NewContactPage(),
      transition: Transition.cupertino,
    ),
  ];
}
