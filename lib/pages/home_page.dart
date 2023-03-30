import 'package:flutter/material.dart';

import '../models/conversation.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController listScrollController = ScrollController();

  // 会话列表
  List<Conversation> convs = [];

  // 添加一个会话
  void addConversation() {
    Conversation newConv = Conversation();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChatPage(convId: newConv.id)));
    setState(() {
      convs.add(newConv);
    });
  }

  // 构建会话列表UI
  Widget buildConvsWidge() {
    List<Widget> convWidgets = convs
        .map((conv) => ListTile(
              leading: const Icon(Icons.chat),
              title: Text(conv.title),
              subtitle: Text(conv.lastMessage?.msg ?? ''),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatPage(convId: conv.id)));
              },
            ))
        .toList();
    return ListView(
      children: convWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Center(
          child: convs.isEmpty
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '目前没有会话',
                    )
                  ],
                )
              : buildConvsWidge()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        onPressed: addConversation,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
