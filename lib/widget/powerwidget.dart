import 'package:flutter/material.dart';

class PowerWidget extends StatelessWidget {
  PowerWidget({
    required this.power,
    TextStyle? textStyle,
  }) {
    this.textStyle = textStyle == null ? TextStyle(fontSize: 30.0) : textStyle;
  }
  int power;
  TextStyle textStyle = TextStyle(fontSize: 30.0);
  double boxHeight = 90.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: textStyle.fontSize! * 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$power',
            style: textStyle,
          ),
        ],
      ),
      // width: 30.0,
      // height: 40.0,
    );
  }
}
