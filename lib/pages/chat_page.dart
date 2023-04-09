import 'dart:js_interop';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:maid_gpt/comp/bubble_comp.dart';
import 'package:maid_gpt/comp/msg_input_comp.dart';
import 'package:maid_gpt/models/conversation.dart';
import 'package:uuid/uuid.dart';

import '../models/message.dart';
import '../models/role.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.convId});

  final String convId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> msgList = [];

  String getConvSPKey() {
    return 'conv:$widget.convId';
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
    return Wrap(
      children:
          msgList.map((msg) => buildBubbleWidget(msg.msg, msg.role)).toList(),
    );
  }

  Widget buildInputWidget() {
    return MsgInput(
      onSend: (String value) {
        if (value.isNotEmpty) {
          setState(() {
            msgList.add(
                Message(id: const Uuid().v4(), role: Role.user, msg: value));
          });
          // 将消息存本地一份
          String msgString = Message.encode(msgList);
          SpUtil.putString(getConvSPKey(), msgString);
          // TODO 发送请求
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    String? msgsString = SpUtil.getString(getConvSPKey());
    if (msgsString.isNull || msgsString == '') return;

    msgList = Message.decode(msgsString!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Center(
          child: Text('test'),
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
