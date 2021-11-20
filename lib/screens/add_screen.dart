import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/calculation_brain.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  CalculationBrain calBrain = CalculationBrain();
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    calBrain.resetNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '맞춘 개수: ' + calBrain.correctCount.toString(),
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
          Text(
            calBrain.y >= 0
                ? '${calBrain.x.toString()}+${calBrain.y.toString()} ='
                : '${calBrain.x.toString()}' + '${calBrain.y.toString()} =',
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
                          calBrain.choiceA_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            calBrain.checkAnswer(calBrain.choiceA_value);
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
                          calBrain.choiceB_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            calBrain.checkAnswer(calBrain.choiceB_value);
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
                          calBrain.choiceC_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            calBrain.checkAnswer(calBrain.choiceC_value);
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
                          calBrain.choiceD_text,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          setState(() {
                            calBrain.checkAnswer(calBrain.choiceD_value);
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
