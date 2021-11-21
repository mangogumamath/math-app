import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';

class FractionWidget extends StatelessWidget {
  FractionWidget(this.numerator, this.dinominator,
      {TextStyle? textStyle, Color? dividerColor, double? dividerWidth}) {
    fraction = Fraction(numerator, dinominator);
    sign = fraction.isNegative ? '-' : '';
    this.textStyle = textStyle == null ? TextStyle(fontSize: 40.0) : textStyle;
    this.dividerColor = dividerColor == null ? Colors.white : dividerColor;
    this.dividerWidth = dividerWidth == null ? 40.0 : dividerWidth;
  }
  int numerator;
  int dinominator;
  Fraction fraction = Fraction(1, 2);
  String sign = '';
  TextStyle textStyle = TextStyle(fontSize: 40.0);
  Color dividerColor = Colors.white;
  double dividerWidth = 40.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sign,
              style: textStyle,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  fraction.numerator.abs().toString(),
                  style: textStyle,
                ),
                Container(
                  color: dividerColor,
                  width: dividerWidth,
                  height: dividerWidth * 0.15,
                ),
                Text(
                  fraction.denominator.abs().toString(),
                  style: textStyle,
                ),
              ],
            )
          ],
        ),
      ),
      // width: 30.0,
      // height: 40.0,
    );
  }
}
