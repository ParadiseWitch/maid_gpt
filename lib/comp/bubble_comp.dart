import 'package:flutter/material.dart';
import 'package:maid_gpt/models/message_chat.dart';

class Bubble extends StatefulWidget {
  const Bubble({super.key, required this.msg, required this.role});

  final String msg;
  final Role role;

  @override
  State<StatefulWidget> createState() {
    return BubbleState();
  }
}

class BubbleState extends State<Bubble> {
  String msg = '......';

  Widget buildRoundRect(
      {required bool isLeft, required List<Widget> children}) {
    EdgeInsets margin =
        const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15);
    EdgeInsets padding = const EdgeInsets.all(13);
    Radius radius = const Radius.circular(13);
    Color bgColor = Colors.grey;

    return Container(
      constraints: const BoxConstraints(
        minWidth: 50,
      ),
      margin: margin,
      child: isLeft
          ? ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: radius, topLeft: radius, topRight: radius),
              child: Container(
                color: bgColor,
                child: Container(
                  padding: padding,
                  child: Wrap(children: children),
                ),
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: radius, topLeft: radius, topRight: radius),
              child: Container(
                color: bgColor,
                child: Container(
                  margin: padding,
                  child: Wrap(children: children),
                ),
              ),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.msg.isNotEmpty) msg = widget.msg;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment:
            widget.role == Role.maid ? Alignment.topLeft : Alignment.topRight,
        child: buildRoundRect(
            isLeft: widget.role == Role.maid, children: [Text(msg)]),
      ),
    );
  }
}
