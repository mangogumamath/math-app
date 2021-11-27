import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/mul_two_brain.dart';
import 'package:flutter/material.dart';

class MulTwoScreen extends StatefulWidget {
  @override
  _MulTwoScreenState createState() => _MulTwoScreenState();
}

class _MulTwoScreenState extends State<MulTwoScreen> {
  MulTwoBrain mulTwoBrain = MulTwoBrain();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mulTwoBrain.resetNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '맞춘 개수: ' + mulTwoBrain.correctCount.toString(),
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
          Text(
            mulTwoBrain.questionText,
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
                          mulTwoBrain.choiceA_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            mulTwoBrain.checkAnswer(mulTwoBrain.choiceA_value);
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
                          mulTwoBrain.choiceB_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            mulTwoBrain.checkAnswer(mulTwoBrain.choiceB_value);
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
                          mulTwoBrain.choiceC_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            mulTwoBrain.checkAnswer(mulTwoBrain.choiceC_value);
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
                          mulTwoBrain.choiceD_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            mulTwoBrain.checkAnswer(mulTwoBrain.choiceD_value);
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
