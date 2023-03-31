import 'package:flutter/material.dart';

class Bubble extends StatefulWidget {
  const Bubble({super.key});

  @override
  State<StatefulWidget> createState() {
    return BubbleState();
  }
}

class BubbleState extends State<Bubble> {
  Widget buildRoundRect({required bool isLeft, required Widget child}) {
    double margin = 10;
    double padding = 10;
    double radius = 10;
    Color bgColor = Colors.green;

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
                  child: Wrap(children: [child]),
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
                  child: Wrap(children: [child]),
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildRoundRect(
        isLeft: true,
        child: const Text(
            'dataxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
  }
}
