import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/addsub_brain.dart';
import 'package:calculation_game/model/mul_many_brain.dart';
import 'package:calculation_game/model/mul_two_brain.dart';

import 'package:flutter/material.dart';

class MulManyScreen extends StatefulWidget {
  @override
  _MulManyScreenState createState() => _MulManyScreenState();
}

class _MulManyScreenState extends State<MulManyScreen> {
  MulManyBrain mulManyBrain = MulManyBrain();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mulManyBrain.resetNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '맞춘 개수: ' + mulManyBrain.correctCount.toString(),
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
          Text(
            mulManyBrain.questionText,
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: calculationButtonStyle,
                        child: Text(
                          mulManyBrain.choiceA_text,
                          style: TextStyle(fontSize: 40),
                        ),
                        onPressed: () {
                          setState(() {
                            mulManyBrain
                                .checkAnswer(mulManyBrain.choiceA_value);
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
                        child: Text(
                          mulManyBrain.choiceB_text,
                          style: TextStyle(fontSize: 40),
                        ),
                        onPressed: () {
                          setState(() {
                            mulManyBrain
                                .checkAnswer(mulManyBrain.choiceB_value);
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
                        child: Text(
                          mulManyBrain.choiceC_text,
                          style: TextStyle(fontSize: 40),
                        ),
                        onPressed: () {
                          setState(() {
                            mulManyBrain
                                .checkAnswer(mulManyBrain.choiceC_value);
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
                        child: Text(
                          mulManyBrain.choiceD_text,
                          style: TextStyle(fontSize: 40),
                        ),
                        onPressed: () {
                          setState(() {
                            mulManyBrain
                                .checkAnswer(mulManyBrain.choiceD_value);
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
