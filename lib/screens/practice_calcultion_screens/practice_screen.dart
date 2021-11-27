import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/calculation_brain.dart';
import 'package:calculation_game/model/level_brain.dart';
import 'package:calculation_game/widget/choose_answer_button.dart';
import 'package:calculation_game/widget/fraction_reduced_widget.dart';
import 'package:calculation_game/widget/right_wrong_widget.dart';
import 'package:flutter/material.dart';

class PracticeScreen extends StatefulWidget {
  PracticeScreen({required this.calculationType});
  CalculationType calculationType;
  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen>
    with TickerProviderStateMixin {
  CalculationBrain calculationBrain =
      CalculationBrain(calculationType: CalculationType.sameAdd);
  LevelBrain levelBrain = LevelBrain();

  bool rightAnswerBool = true;

  late AnimationController animationController;
  late Animation animation;

  late AnimationController gaugeController;
  double timeGaugeValue = 0.0;

  bool isButtonDisabled = false;

  String levelText = '';

  Widget chooseButtonA = ChooseAnswerButton();
  Widget chooseButtonB = ChooseAnswerButton();
  Widget chooseButtonC = ChooseAnswerButton();
  Widget chooseButtonD = ChooseAnswerButton();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //연산담당자 인스턴스 생성
    calculationBrain =
        CalculationBrain(calculationType: widget.calculationType);

    //숫자 리셋
    calculationBrain.resetNumber();

    //맞고 틀림 위젯 애니메이션 관리
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut);

    //맞고 틀림 위젯 애니메이션 리스너
    animationController.addListener(() {
      setState(() {});
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reset();
      }
    });

    //시간 게이지 위젯 애니메이션 관리, 종료 대화창 관리
    gaugeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    gaugeController.forward();

    //시간 게이지 애니메이션 리스너
    gaugeController.addListener(() {
      timeGaugeValue = 1 - gaugeController.value;
      setState(() {});
    });
    gaugeController.addStatusListener((status) {
      //종료 대화창
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
                          calculationBrain.score.toString() + ' 점',
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
                            builder: (context) => PracticeScreen(
                                  calculationType: widget.calculationType,
                                )));
                      },
                      child: Text('다시 하기')),
                ],
              );
            });
      }
    });
  }

  //위젯 컨트롤에 관여하므로 이 함수는 여기에 둔다.
  void showMark_goGauge_levelUpCheck_function(bool rightAnswerBool) {
    levelBrain.levelUpCheck(calculationBrain.score);

    animationController.reset();
    animationController.forward();

    if (rightAnswerBool) {
      gaugeController.duration = Duration(seconds: levelBrain.quizTimeSecond);
      gaugeController.reset();
      gaugeController.forward();
    }
  }

  //위젯 컨트롤에 관여하므로 이 함수는 여기에 둔다.
  void chooseAnswerButton_function(dynamic submittedAnswer) {
    setState(() {
      calculationBrain.checkAnswer(
          submittedAnswer,
          (timeGaugeValue * levelBrain.scoreMul).round(),
          (levelBrain.minusScore).round());
      rightAnswerBool = calculationBrain.checkBool;
      showMark_goGauge_levelUpCheck_function(rightAnswerBool);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //애니메이션들 종료
    animationController.dispose();
    gaugeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //나눗셈인지 아닌지에 따른 버튼 위젯 생성
    if (widget.calculationType == CalculationType.division ||
        widget.calculationType == CalculationType.mix) {
      chooseButtonA = ChooseAnswerButton(
        isDisabled: isButtonDisabled,
        buttonChild: FractionReducedWidget(
          calculationBrain.choiceA_value.numerator,
          calculationBrain.choiceA_value.denominator,
          dividerColor: Colors.black,
          dividerWidth: 30.0,
          textStyle: TextStyle(fontSize: 30.0),
        ),
        onPressed: () {
          chooseAnswerButton_function(calculationBrain.choiceA_value);
        },
      );
      chooseButtonB = ChooseAnswerButton(
        isDisabled: isButtonDisabled,
        buttonChild: FractionReducedWidget(
          calculationBrain.choiceB_value.numerator,
          calculationBrain.choiceB_value.denominator,
          dividerColor: Colors.black,
          dividerWidth: 30.0,
          textStyle: TextStyle(fontSize: 30.0),
        ),
        onPressed: () {
          chooseAnswerButton_function(calculationBrain.choiceB_value);
        },
      );
      chooseButtonC = ChooseAnswerButton(
        isDisabled: isButtonDisabled,
        buttonChild: FractionReducedWidget(
          calculationBrain.choiceC_value.numerator,
          calculationBrain.choiceC_value.denominator,
          dividerColor: Colors.black,
          dividerWidth: 30.0,
          textStyle: TextStyle(fontSize: 30.0),
        ),
        onPressed: () {
          chooseAnswerButton_function(calculationBrain.choiceC_value);
        },
      );
      chooseButtonD = ChooseAnswerButton(
        isDisabled: isButtonDisabled,
        buttonChild: FractionReducedWidget(
          calculationBrain.choiceD_value.numerator,
          calculationBrain.choiceD_value.denominator,
          dividerColor: Colors.black,
          dividerWidth: 30.0,
          textStyle: TextStyle(fontSize: 30.0),
        ),
        onPressed: () {
          chooseAnswerButton_function(calculationBrain.choiceD_value);
        },
      );
    } else {
      chooseButtonA = ChooseAnswerButton(
        isDisabled: isButtonDisabled,
        buttonText: calculationBrain.choiceA_text,
        onPressed: () {
          chooseAnswerButton_function(calculationBrain.choiceA_value);
        },
      );
      chooseButtonB = ChooseAnswerButton(
        isDisabled: isButtonDisabled,
        buttonText: calculationBrain.choiceB_text,
        onPressed: () {
          chooseAnswerButton_function(calculationBrain.choiceB_value);
        },
      );
      chooseButtonC = ChooseAnswerButton(
        isDisabled: isButtonDisabled,
        buttonText: calculationBrain.choiceC_text,
        onPressed: () {
          chooseAnswerButton_function(calculationBrain.choiceC_value);
        },
      );
      chooseButtonD = ChooseAnswerButton(
        isDisabled: isButtonDisabled,
        buttonText: calculationBrain.choiceD_text,
        onPressed: () {
          chooseAnswerButton_function(calculationBrain.choiceD_value);
        },
      );
    }

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
                    '점수: ' + calculationBrain.score.toString(),
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
              ), // 점수와 레벨
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
              ), //시간 게이지
              SizedBox(
                height: 100.0,
                width: 100.0,
                child: Center(
                  child: RightWrongWidget(
                      iconsize: animation.value * 80.0,
                      answerBool: rightAnswerBool),
                ),
              ), //맞추거나 틀렸음을 나타내는 아이콘
            ],
          ),
          calculationBrain.questionWidget, //문제 위젯
          Column(
            children: [
              Row(
                children: [
                  chooseButtonA,
                  chooseButtonB,
                ],
              ), //버튼 A, B
              Row(
                children: [
                  chooseButtonC,
                  chooseButtonD,
                ],
              ), //버튼 C, D
            ],
          ),
        ],
      ),
    );
  }
}
