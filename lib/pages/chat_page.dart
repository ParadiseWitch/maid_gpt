import 'package:flutter/material.dart';
import 'package:maid_gpt/comp/bubble.dart';

import '../models/message_chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.convId});

  final String convId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  Widget buildTitleBar() {
    return const Text('');
  }

  Widget buildBubbleWidget() {
    return const Bubble(
      msg: '',
      role: Role.maid,
    );
  }

  Widget buildBubbleListWidget() {
    return const Text('');
  }

  Widget buildInputWidget() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
          color: Colors.white),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              onSubmitted: (value) {},
              style: const TextStyle(color: Colors.grey, fontSize: 15),
              controller: textEditingController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Type your message...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              focusNode: focusNode,
              autofocus: true,
            ),
          ),
          // Button send message
          Material(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
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
          child: WillPopScope(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    buildBubbleWidget(),
                    // buildInputWidget(),
                  ],
                )
              ],
            ),
            onWillPop: () async {
              return true;
            },
          ),
        ));
  }
}
