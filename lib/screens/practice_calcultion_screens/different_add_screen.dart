import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/different_add_brain.dart';
import 'package:calculation_game/model/level_brain.dart';
import 'package:calculation_game/widget/choose_answer_button.dart';
import 'package:calculation_game/widget/right_wrong_widget.dart';
import 'package:flutter/material.dart';

class DifferentAddScreen extends StatefulWidget {
  @override
  _DifferentAddScreenState createState() => _DifferentAddScreenState();
}

class _DifferentAddScreenState extends State<DifferentAddScreen>
    with TickerProviderStateMixin {
  DifferentAddBrain differentAddBrain = DifferentAddBrain();
  LevelBrain levelBrain = LevelBrain();

  bool rightAnswerBool = true;

  late AnimationController animationController;
  late Animation animation;

  late AnimationController gaugeController;
  double timeGaugeValue = 0.0;

  bool isButtonDisabled = false;

  String levelText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reset();
      }
    });

    differentAddBrain.resetNumber();

    gaugeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    gaugeController.addListener(() {
      timeGaugeValue = 1 - gaugeController.value;
      setState(() {});
    });
    gaugeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isButtonDisabled = true;
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('결과'),
                titleTextStyle:
                    TextStyle(fontSize: 30.0, fontFamily: 'ONEMobilePOP'),
                contentTextStyle:
                    TextStyle(fontSize: 40.0, fontFamily: 'ONEMobilePOP'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Center(
                        child: Text(
                          differentAddBrain.score.toString() + ' 점',
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('확인')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => DifferentAddScreen()));
                      },
                      child: Text('다시 하기')),
                ],
              );
            });
      }
    });

    gaugeController.forward();
  }

  void showMark_goGauge_levelUpCheck_function(bool rightAnswerBool) {
    levelBrain.levelUpCheck(differentAddBrain.score);

    animationController.reset();
    animationController.forward();

    if (rightAnswerBool) {
      gaugeController.duration = Duration(seconds: levelBrain.quizTimeSecond);
      gaugeController.reset();
      gaugeController.forward();
    }
  }

  void chooseAnswerButton_function(int choiceValue) {
    setState(() {
      differentAddBrain.checkAnswer(
          choiceValue,
          (timeGaugeValue * levelBrain.scoreMul).round(),
          (levelBrain.minusScore).round());
      rightAnswerBool = differentAddBrain.checkBool;
      showMark_goGauge_levelUpCheck_function(rightAnswerBool);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    gaugeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '점수: ' + differentAddBrain.score.toString(),
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                  Text(
                    levelBrain.levelText,
                    style: TextStyle(
                      color: levelBrain.levelTextColor,
                      fontSize: 40.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: (timeGaugeValue * 10000).round() + 1,
                    child: Container(
                      height: 10.0,
                      color: timeGaugeValue > 0.3
                          ? levelBrain.levelTextColor
                          : Colors.redAccent,
                    ),
                  ),
                  Flexible(
                    flex: (10000 - timeGaugeValue * 10000).round(),
                    child: Container(
                      height: 10.0,
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100.0,
                width: 100.0,
                child: Center(
                  child: RightWrongWidget(
                      iconsize: animation.value * 80.0,
                      answerBool: rightAnswerBool),
                ),
              ),
            ],
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
                  ChooseAnswerButton(
                    isDisabled: isButtonDisabled,
                    buttonText: differentAddBrain.choiceA_text,
                    onPressed: () {
                      chooseAnswerButton_function(
                          differentAddBrain.choiceA_value);
                    },
                  ),
                  ChooseAnswerButton(
                    isDisabled: isButtonDisabled,
                    buttonText: differentAddBrain.choiceB_text,
                    onPressed: () {
                      chooseAnswerButton_function(
                          differentAddBrain.choiceB_value);
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  ChooseAnswerButton(
                    isDisabled: isButtonDisabled,
                    buttonText: differentAddBrain.choiceC_text,
                    onPressed: () {
                      chooseAnswerButton_function(
                          differentAddBrain.choiceC_value);
                    },
                  ),
                  ChooseAnswerButton(
                    isDisabled: isButtonDisabled,
                    buttonText: differentAddBrain.choiceD_text,
                    onPressed: () {
                      chooseAnswerButton_function(
                          differentAddBrain.choiceD_value);
                    },
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
