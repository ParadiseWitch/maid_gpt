import 'package:flutter/material.dart';
import 'package:maid_gpt/pages/chat_page.dart';
import 'package:maid_gpt/pages/home_page.dart';

void main() {
  runApp(const MaidGPT());
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
      // home: const HomePage(title: 'MaidGPT'),
      home: const ChatPage(convId: ''),
    );
  }
}
