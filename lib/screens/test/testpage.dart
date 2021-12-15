import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/calculation_brain.dart';
import 'package:flutter/material.dart';
import 'package:fraction/src/extensions/fraction_num.dart';
import 'package:math_parser/math_parser.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final calBrain = CalculationBrain(calculationType: CalculationType.mix);

  @override
  Widget build(BuildContext context) {
    String text = '(6*(-1)^2)-1/3';
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          calBrain.questionWidget,
          Text('${MathNodeExpression.fromString(text).calc(MathVariableValues({
                    'x': 0
                  })).toFraction()}'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                calBrain.resetNumber();
              });
            },
            child: Text('버튼'),
          )
        ],
      ),
    );
  }
}
