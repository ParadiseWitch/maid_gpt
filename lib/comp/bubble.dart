import 'package:flutter/material.dart';

class Bubble extends StatefulWidget {
  const Bubble({super.key});

  @override
  State<StatefulWidget> createState() {
    return BubbleState();
  }
}

class BubbleState extends State<Bubble> {
  Widget buildRoundRect(
      {required bool isLeft, required List<Widget> children}) {
    double margin = 15;
    double padding = 12;
    double radius = 13;
    Color bgColor = Colors.grey;

    return Container(
      margin: EdgeInsets.all(margin),
      child: isLeft
          ? ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(radius),
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius)),
              child: Container(
                color: bgColor,
                child: Container(
                  padding: EdgeInsets.all(padding),
                  child: Wrap(children: children),
                ),
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius)),
              child: Container(
                color: bgColor,
                child: Container(
                  margin: EdgeInsets.all(padding),
                  child: Wrap(children: children),
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildRoundRect(isLeft: true, children: [
      const Text(
          'dataxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
      const Text(
          'dataxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
    ]);
  }
}
