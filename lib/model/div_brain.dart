import 'dart:math';

import 'package:calculation_game/widget/fractionwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:fraction/fraction.dart';

//여기가 주방. 계산은 여기서 처리하기.
class DivBrain {
  int a = 0;
  int b = 0;
  int c = 0;
  int d = 0;
  Fraction frac_x = Fraction(1, 1);
  Fraction frac_y = Fraction(1, 1);
  Fraction realAnswer = Fraction(1);
  Fraction choiceA_value = Fraction(1);
  Fraction choiceB_value = Fraction(1);
  Fraction choiceC_value = Fraction(1);
  Fraction choiceD_value = Fraction(1);
  List<Fraction> choiceList = [];
  String choiceA_text = 'A';
  String choiceB_text = 'B';
  String choiceC_text = 'C';
  String choiceD_text = 'D';

  bool checkBool = true;
  int correctCount = 0;

  Widget questionRow = Row();

  void resetNumber() {
    choiceList.clear();

    Set choiceSet = {};

    // bool randomSignBool = Random().nextBool();

    a = Random().nextBool()
        ? Random().nextInt(9) + 1
        : (Random().nextInt(9) + 1) * -1;
    b = Random().nextInt(9) + 1;
    c = Random().nextBool()
        ? Random().nextInt(9) + 1
        : (Random().nextInt(9) + 1) * -1;
    d = Random().nextInt(9) + 1;

    frac_x = Fraction(a, b).reduce();
    frac_y = Fraction(c, d).reduce();

    questionRow = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: !frac_y.isNegative
          ? [
              FractionWidget(frac_x.numerator, frac_x.denominator),
              Text(
                '÷',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              FractionWidget(frac_y.numerator, frac_y.denominator)
            ]
          : [
              FractionWidget(frac_x.numerator, frac_x.denominator),
              Text(
                '÷',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              Text(
                '(',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              FractionWidget(frac_y.numerator, frac_y.denominator),
              Text(
                ')',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
            ],
    );

    choiceSet.add(frac_x / frac_y);

    while (choiceSet.length < 4) {
      choiceSet.add(
        Random().nextBool()
            ? Fraction(frac_x.numerator + Random().nextInt(20) - 10,
                frac_x.denominator + Random().nextInt(5) + 1)
            : Fraction((frac_y.numerator + Random().nextInt(20) - 10) * -1,
                frac_y.denominator + Random().nextInt(5) + 1),
      );
    }
    choiceList = [...choiceSet];
    choiceList.shuffle();

    choiceA_value = choiceList[0];
    choiceB_value = choiceList[1];
    choiceC_value = choiceList[2];
    choiceD_value = choiceList[3];

    choiceA_text = !choiceA_value.isNegative
        ? '+${choiceA_value.toString()}'
        : choiceA_value.toString();
    choiceB_text = !choiceB_value.isNegative
        ? '+${choiceB_value.toString()}'
        : choiceB_value.toString();
    choiceC_text = !choiceC_value.isNegative
        ? '+${choiceC_value.toString()}'
        : choiceC_value.toString();
    choiceD_text = !choiceD_value.isNegative
        ? '+${choiceD_value.toString()}'
        : choiceD_value.toString();
  }

  void checkAnswer(Fraction submittedAnswer) {
    realAnswer = frac_x / frac_y;
    checkBool = submittedAnswer == realAnswer ? true : false;
    checkBool ? correctCount++ : {};
    resetNumber();
  }
}
