import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/calculation_brain.dart';
import 'package:calculation_game/model/different_add_brain.dart';
import 'package:flutter/material.dart';

class DifferentAddScreen extends StatefulWidget {
  @override
  _DifferentAddScreenState createState() => _DifferentAddScreenState();
}

class _DifferentAddScreenState extends State<DifferentAddScreen> {
  DifferentAddBrain differentAddBrain = DifferentAddBrain();
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    differentAddBrain.resetNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '맞춘 개수: ' + differentAddBrain.correctCount.toString(),
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
          Text(
            differentAddBrain.questionText,
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
                          differentAddBrain.choiceA_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            differentAddBrain
                                .checkAnswer(differentAddBrain.choiceA_value);
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
                          differentAddBrain.choiceB_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            differentAddBrain
                                .checkAnswer(differentAddBrain.choiceB_value);
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
                          differentAddBrain.choiceC_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            differentAddBrain
                                .checkAnswer(differentAddBrain.choiceC_value);
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
                          differentAddBrain.choiceD_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            differentAddBrain
                                .checkAnswer(differentAddBrain.choiceD_value);
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
