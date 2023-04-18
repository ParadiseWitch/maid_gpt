import 'package:flutter/material.dart';
import 'package:maid_gpt/comp/bubble_comp.dart';
import 'package:maid_gpt/comp/msg_input_comp.dart';
import 'package:maid_gpt/models/conversation.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/message.dart';
import '../models/role.dart';
import '../store/store.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.convId});

  final String convId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Conversation? conv;
  // List<Message> msgList = [];

  Conversation getConv() {
    Store store = Provider.of<Store>(context, listen: false);
    Conversation conv = store.convMap[widget.convId]!;
    return conv;
  }

  List<Message> getMsgList() {
    return getConv().msgList;
  }

  Widget buildTitleBar() {
    return const Text('');
  }

  Widget buildBubbleWidget(String msg, Role role) {
    return Bubble(
      msg: msg,
      role: role,
    );
  }

  Widget buildBubbleListWidget() {
    if (getMsgList().isEmpty) {
      return const SizedBox();
    }
    return Wrap(
      children: getMsgList()
          .map((msg) => buildBubbleWidget(msg.msg, msg.role))
          .toList(),
    );
  }

  Widget buildInputWidget() {
    return MsgInput(
      onSend: (String value) async {
        Store store = Provider.of<Store>(context, listen: false);
        setState(() {
          store.addConvMsg(widget.convId,
              Message(id: const Uuid().v4(), role: Role.user, msg: value));
        });
        // 将消息存本地一份
        // TODO 发送请求
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Center(
          child: Text(getConv().title),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                buildBubbleListWidget(),
                const SizedBox(
                  height: 60,
                )
                // buildInputWidget(),
                // buildInputWidget(),
              ],
            )
          ],
        ),
      ),
      bottomSheet: buildInputWidget(),
    );
  }
}
