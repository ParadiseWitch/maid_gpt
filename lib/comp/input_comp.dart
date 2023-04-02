import 'package:flutter/material.dart';

class InputMsgBox extends StatefulWidget {
  const InputMsgBox({super.key});

  @override
  State<StatefulWidget> createState() {
    return InputMsgBoxState();
  }
}

class InputMsgBoxState extends State<InputMsgBox> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
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
}
