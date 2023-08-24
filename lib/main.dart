import 'package:contact_book/core/locator.dart';
import 'package:contact_book/core/routes/route_path.dart';
import 'package:contact_book/core/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(AppConfiguration());
}

class AppConfiguration extends StatefulWidget {
  @override
  _AppConfigurationState createState() => _AppConfigurationState();
}

class _AppConfigurationState extends State<AppConfiguration> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool isEn = true;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) async {}

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ST Dev',
      supportedLocales: [
        Locale("en", "US"),
      ],
      locale: Locale("en", "US"),
      navigatorKey: Get.key,
      initialRoute: RoutePath.splashRoute,
      getPages: AppRouter.pages,
    );
  }
}
