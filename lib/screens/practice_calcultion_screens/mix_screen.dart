import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/addsub_brain.dart';
import 'package:calculation_game/model/div_brain.dart';
import 'package:calculation_game/model/generalterm_brain.dart';
import 'package:calculation_game/model/mix_brain.dart';
import 'package:calculation_game/model/mul_two_brain.dart';
import 'package:calculation_game/widget/fraction_reduced_widget.dart';
import 'package:calculation_game/widget/fractionwidget.dart';

import 'package:flutter/material.dart';

class MixScreen extends StatefulWidget {
  @override
  _MixScreenState createState() => _MixScreenState();
}

class _MixScreenState extends State<MixScreen> {
  MixBrain mixBrain = MixBrain();
  GeneralTermBrain generalTermBrain = GeneralTermBrain();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mixBrain.resetNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '맞춘 개수: ' + mixBrain.correctCount.toString(),
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
          mixBrain.questionRow,
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
                          mixBrain.choiceA_value.numerator,
                          mixBrain.choiceA_value.denominator,
                          dividerColor: Colors.black,
                          dividerWidth: 30.0,
                          textStyle: TextStyle(fontSize: 30.0),
                        ),
                        onPressed: () {
                          setState(() {
                            mixBrain.checkAnswer(mixBrain.choiceA_value);
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
                          mixBrain.choiceB_value.numerator,
                          mixBrain.choiceB_value.denominator,
                          dividerColor: Colors.black,
                          dividerWidth: 30.0,
                          textStyle: TextStyle(fontSize: 30.0),
                        ),
                        onPressed: () {
                          setState(() {
                            mixBrain.checkAnswer(mixBrain.choiceB_value);
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
                          mixBrain.choiceC_value.numerator,
                          mixBrain.choiceC_value.denominator,
                          dividerColor: Colors.black,
                          dividerWidth: 30.0,
                          textStyle: TextStyle(fontSize: 30.0),
                        ),
                        onPressed: () {
                          setState(() {
                            mixBrain.checkAnswer(mixBrain.choiceC_value);
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
                          mixBrain.choiceD_value.numerator,
                          mixBrain.choiceD_value.denominator,
                          dividerColor: Colors.black,
                          dividerWidth: 30.0,
                          textStyle: TextStyle(fontSize: 30.0),
                        ),
                        onPressed: () {
                          setState(() {
                            mixBrain.checkAnswer(mixBrain.choiceD_value);
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
