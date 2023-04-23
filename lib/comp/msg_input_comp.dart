import 'package:flutter/material.dart';

class MsgInput extends StatefulWidget {
  const MsgInput({super.key, required this.onSend});

  final ValueChanged<String> onSend;

  @override
  State<StatefulWidget> createState() {
    return MsgInputState();
  }
}

class MsgInputState extends State<MsgInput> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  String msg = '';

  void sendMessage() {
    if(msg == '') return;
    widget.onSend(msg);
    textEditingController.clear();
    msg = '';
  }

  @override
  Widget build(BuildContext context) {
    Border border = const Border(
      top: BorderSide(color: Color.fromARGB(255, 223, 223, 223), width: 0.5),
      bottom: BorderSide(color: Color.fromARGB(255, 223, 223, 223), width: 0.1),
    );

    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: border,
        color: const Color.fromRGBO(255, 255, 255, 1),
        // borderRadius: const BorderRadius.all(Radius.circular(0.1)),
      ),
      child: Row(
        children: <Widget>[
          const Spacer(
            flex: 1,
          ),
          Flexible(
            flex: 13,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  msg = value;
                });
              },
              style: const TextStyle(color: Colors.grey, fontSize: 14),
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
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: sendMessage,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
