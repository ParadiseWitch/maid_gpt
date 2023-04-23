import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

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
      initialRoute: '/',
      initialBinding: null,
      getPages: [GetPage(name: 'home', page: () => const Text(''))],
      locale: const Locale('zh', 'CN'),
      builder: null,
      debugShowCheckedModeBanner: false,
    );
  }
}
