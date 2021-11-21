import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/addsub_brain.dart';

import 'package:flutter/material.dart';

class AddSubScreen extends StatefulWidget {
  @override
  _AddSubScreenState createState() => _AddSubScreenState();
}

class _AddSubScreenState extends State<AddSubScreen> {
  AddSubBrain addSubBrain = AddSubBrain();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    addSubBrain.resetNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '맞춘 개수: ' + addSubBrain.correctCount.toString(),
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
          Text(
            addSubBrain.y >= 0
                ? '${addSubBrain.x.toString()}+${addSubBrain.y.toString()} ='
                : '${addSubBrain.x.toString()}' +
                    '${addSubBrain.y.toString()} =',
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
                          addSubBrain.choiceA_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            addSubBrain.checkAnswer(addSubBrain.choiceA_value);
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
                          addSubBrain.choiceB_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            addSubBrain.checkAnswer(addSubBrain.choiceB_value);
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
                          addSubBrain.choiceC_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            addSubBrain.checkAnswer(addSubBrain.choiceC_value);
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
                          addSubBrain.choiceD_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            addSubBrain.checkAnswer(addSubBrain.choiceD_value);
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
