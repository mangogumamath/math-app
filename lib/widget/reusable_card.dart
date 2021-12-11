import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour, this.cardChild, this.onPress, double? height}) {
    this.height = height ?? 100.0;
  }
  final Color colour;
  final Widget? cardChild;
  final Function()? onPress;
  double height = 100.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      color: colour,
      child: InkWell(
        child: SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: cardChild,
          ),
        ),
        onTap: onPress,
      ),
    );
  }
}
