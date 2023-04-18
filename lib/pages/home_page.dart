import 'package:flutter/material.dart';
import 'package:maid_gpt/store/store.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

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

  // 添加一个会话
  void addConversation() {
    Conversation newConv =
        Conversation(id: const Uuid().v4(), title: '未命名', msgList: []);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatPage(
                  convId: newConv.id,
                  onBack: () async {
                    Navigator.pop(context);
                    setState(() {});
                    return true;
                  },
                )));

    Store store = Provider.of<Store>(context, listen: false);
    setState(() {
      store.addConv(newConv);
    });
    print(store.convMap.toString());
  }

  bool hasConvs() {
    Store store = Provider.of<Store>(context, listen: false);
    return store.convMap.isNotEmpty;
  }

  // 构建会话列表UI
  Widget buildConvsWidget() {
    Store store = Provider.of<Store>(context, listen: false);
    Map<String, Conversation> convMap = store.convMap;
    List<MapEntry<String, Conversation>> entries = convMap.entries.toList();
    List<Widget> convWidgets = entries.map(
      (entry) {
        Conversation conv = entry.value;
        return ListTile(
          leading: const Icon(Icons.chat),
          title: Text(conv.title),
          subtitle: Text(conv.getLastMsg()?.msg ?? ''),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  convId: conv.id,
                  onBack: () async {
                    Navigator.pop(context);
                    setState(() {});
                    return true;
                  },
                ),
              ),
            );
          },
        );
      },
    ).toList();
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
        child: hasConvs()
            ? buildConvsWidget()
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '目前没有会话',
                  )
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        onPressed: () {
          addConversation();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
