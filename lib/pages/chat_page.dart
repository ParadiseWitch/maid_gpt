import 'package:flutter/material.dart';
import 'package:maid_gpt/comp/bubble_comp.dart';
import 'package:maid_gpt/comp/msg_input_comp.dart';
import 'package:maid_gpt/helper/request_openai.dart';
import 'package:maid_gpt/helper/request_openai2.dart';
import 'package:maid_gpt/models/conversation.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../helper/request_openai_mock.dart';
import '../models/message.dart';
import '../models/role.dart';
import '../store/store.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key, required this.convId, required this.onBack});

  Function onBack = () {};

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
          store.addConvMsg(widget.convId,
              Message(id: const Uuid().v4(), role: Role.maid, msg: '...'));
        });
        // 将消息存本地一份
        // TODO 发送请求

        String resContent = '';
        getMock(
          '讲个笑话',
          host: 'openai.maiiiiiid.asia',
          apiKey: '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',
          onListen: (String data) {
            resContent = resContent + data;
            setState(() {
              store.modifyConvLastMsg(widget.convId, resContent);
            });
          },
        ).then((ret) {
          setState(() {
            store.modifyConvLastMsg(widget.convId, ret['content']);
          resContent = '';
          });
        }).catchError((e) {
          setState(() {
            store.modifyConvLastMsg(widget.convId, e.toString());
          });
        });
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
      body: WillPopScope(
        onWillPop: () {
          return widget.onBack();
        },
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  buildBubbleListWidget(),
                  // buildBubbleWidget(lastMsg, Role.maid),
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
      ),
      bottomSheet: buildInputWidget(),
    );
  }
}
