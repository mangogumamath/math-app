import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/addsub_brain.dart';
import 'package:calculation_game/model/div_brain.dart';
import 'package:calculation_game/model/mul_two_brain.dart';
import 'package:calculation_game/widget/fraction_reduced_widget.dart';
import 'package:calculation_game/widget/fractionwidget.dart';

import 'package:flutter/material.dart';

class DivScreen extends StatefulWidget {
  @override
  _DivScreenState createState() => _DivScreenState();
}

class _DivScreenState extends State<DivScreen> {
  DivBrain divBrain = DivBrain();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    divBrain.resetNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '맞춘 개수: ' + divBrain.correctCount.toString(),
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
          divBrain.questionRow,
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: calculationButtonStyle,
                        child: FractionReducedWidget(
                          divBrain.choiceA_value.numerator,
                          divBrain.choiceA_value.denominator,
                          dividerColor: Colors.black,
                          dividerWidth: 30.0,
                          textStyle: TextStyle(fontSize: 30.0),
                        ),
                        onPressed: () {
                          setState(() {
                            divBrain.checkAnswer(divBrain.choiceA_value);
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: calculationButtonStyle,
                        child: FractionReducedWidget(
                          divBrain.choiceB_value.numerator,
                          divBrain.choiceB_value.denominator,
                          dividerColor: Colors.black,
                          dividerWidth: 30.0,
                          textStyle: TextStyle(fontSize: 30.0),
                        ),
                        onPressed: () {
                          setState(() {
                            divBrain.checkAnswer(divBrain.choiceB_value);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: calculationButtonStyle,
                        child: FractionReducedWidget(
                          divBrain.choiceC_value.numerator,
                          divBrain.choiceC_value.denominator,
                          dividerColor: Colors.black,
                          dividerWidth: 30.0,
                          textStyle: TextStyle(fontSize: 30.0),
                        ),
                        onPressed: () {
                          setState(() {
                            divBrain.checkAnswer(divBrain.choiceC_value);
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: calculationButtonStyle,
                        child: FractionReducedWidget(
                          divBrain.choiceD_value.numerator,
                          divBrain.choiceD_value.denominator,
                          dividerColor: Colors.black,
                          dividerWidth: 30.0,
                          textStyle: TextStyle(fontSize: 30.0),
                        ),
                        onPressed: () {
                          setState(() {
                            divBrain.checkAnswer(divBrain.choiceD_value);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
