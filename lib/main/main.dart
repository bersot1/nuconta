import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:provider/provider.dart';

import '../ui/components/app_theme.dart';
import 'factories/pages/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());
    return GetMaterialApp(
      title: 'NuConta',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: '/',
      navigatorObservers: [routeObserver],
      getPages: [
        GetPage(
          name: '/',
          page: () => makeSplashPage(),
        ),
        GetPage(
          name: '/login',
          page: () => makeLoginPage(),
        ),
        GetPage(name: '/home', page: () => makeHomePageFactory())
      ],
    );
  }
}
