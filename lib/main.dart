import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maid_gpt/pages/home_page.dart';
import 'package:maid_gpt/store/store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  String? storeString = sp.getString(localKey);
  Store store = Store();
  dynamic storeMap;
  if (storeString != null && storeString != '') {
    storeMap = json.decode(storeString);
    store = Store.fromJson(storeMap);
  }

  runApp(
      ChangeNotifierProvider<Store>.value(
        value: store,
        child: const MaidGPT(),
      )
  );
}

class MaidGPT extends StatelessWidget {
  const MaidGPT({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        // debugShowCheckedModeBanner: false,
        home: const HomePage(title: 'MaidGPT'),
      );
  }
}
