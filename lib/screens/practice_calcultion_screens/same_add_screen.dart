import 'package:calculation_game/constants.dart';

import 'package:calculation_game/model/same_add_brain.dart';
import 'package:flutter/material.dart';

class SameAddScreen extends StatefulWidget {
  @override
  _SameAddScreenState createState() => _SameAddScreenState();
}

class _SameAddScreenState extends State<SameAddScreen> {
  SameAddBrain sameAddBrain = SameAddBrain();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    sameAddBrain.resetNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '맞춘 개수: ' + sameAddBrain.correctCount.toString(),
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
          Text(
            sameAddBrain.questionText,
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
                          sameAddBrain.choiceA_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            sameAddBrain
                                .checkAnswer(sameAddBrain.choiceA_value);
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
                          sameAddBrain.choiceB_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            sameAddBrain
                                .checkAnswer(sameAddBrain.choiceB_value);
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
                          sameAddBrain.choiceC_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            sameAddBrain
                                .checkAnswer(sameAddBrain.choiceC_value);
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
                          sameAddBrain.choiceD_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            sameAddBrain
                                .checkAnswer(sameAddBrain.choiceD_value);
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
