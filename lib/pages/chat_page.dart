import 'package:flutter/material.dart';
import 'package:maid_gpt/comp/bubble_comp.dart';
import 'package:maid_gpt/comp/msg_input_comp.dart';

import '../models/message_chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.convId});

  final String convId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
      children: [
        buildBubbleWidget('xxxxxxxxxx', Role.user),
        buildBubbleWidget('xxxxxxxxxxxxxxxxxxxx', Role.maid),
        buildBubbleWidget('xxxxxxxxxxxxxxxxxxxxxxxx', Role.user),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget('xxxxx', Role.maid),
        buildBubbleWidget(
            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
            Role.maid),
      ],
    );
  }

  Widget buildInputWidget() {
    return MsgInput(
      onSend: (String value) {
        // TODO 添加一个气泡
      },
    );
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
