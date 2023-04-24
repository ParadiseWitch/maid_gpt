import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/binding/app_binding.dart';
import 'core/routers/app_routers.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: AppRouter.home,
      initialBinding: AppBinding(),
      getPages: appPages,
      defaultTransition: Transition.rightToLeft,
      locale: const Locale('zh', 'CN'),
      builder: null,
      debugShowCheckedModeBanner: false,
    );
  }
}
