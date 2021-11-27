import 'dart:math';

import 'package:calculation_game/model/generalterm_brain.dart';
import 'package:calculation_game/widget/generalterm_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:fraction/fraction.dart';
import 'package:math_parser/math_parser.dart';

//여기가 주방. 계산은 여기서 처리하기.
class MixBrain {
  int frac_x_numerator = 1;
  int frac_x_denominator = 1;
  int frac_y_numerator = 1;
  int frac_y_denominator = 1;
  int frac_z_numerator = 1;
  int frac_z_denominator = 1;
  int frac_w_numerator = 1;
  int frac_w_denominator = 1;

  int frac_x_power = 1;
  int frac_y_power = 1;
  int frac_z_power = 1;
  int frac_w_power = 1;

  Fraction frac_x = Fraction(1);
  Fraction frac_y = Fraction(1);
  Fraction frac_z = Fraction(1);
  Fraction frac_w = Fraction(1);
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

  GeneralTermBrain generalTermBrain_x = GeneralTermBrain();
  GeneralTermBrain generalTermBrain_y = GeneralTermBrain();
  GeneralTermBrain generalTermBrain_z = GeneralTermBrain();
  GeneralTermBrain generalTermBrain_w = GeneralTermBrain();

  List<String> calList = ['+', '-', '*', '/'];
  String cal1 = '+';
  String cal2 = '+';
  String cal3 = '+';
  List<String> calExpression_List1 = [];
  List<String> calExpression_List2 = [];
  String calExpression1 = '';
  String calExpression2 = '';

  String cal1_string = '';
  String cal2_string = '';

  void resetNumber() {
    choiceList.clear();
    calExpression_List1.clear();
    calExpression_List2.clear();
    calExpression1 = '';
    calExpression2 = '';

    Set choiceSet = {};

    generalTermBrain_x.resetNumber();
    generalTermBrain_y.resetNumber();
    generalTermBrain_z.resetNumber();
    generalTermBrain_w.resetNumber();

    frac_x_numerator = generalTermBrain_x.numerator;
    frac_x_denominator = generalTermBrain_x.denominator;
    frac_y_numerator = generalTermBrain_y.numerator;
    frac_y_denominator = generalTermBrain_y.denominator;
    frac_z_numerator = generalTermBrain_z.numerator;
    frac_z_denominator = generalTermBrain_z.denominator;
    frac_w_numerator = generalTermBrain_w.numerator;
    frac_w_denominator = generalTermBrain_w.denominator;

    frac_x_power = generalTermBrain_x.power;
    frac_y_power = generalTermBrain_y.power;
    frac_z_power = generalTermBrain_z.power;
    frac_w_power = generalTermBrain_w.power;

    cal1 = calList[Random().nextInt(4)];
    cal2 = calList[Random().nextInt(4)];
    cal3 = calList[Random().nextInt(4)];

    cal1_string = cal1;
    cal2_string = cal2;

    if (cal1 == '*') {
      cal1_string = '×';
    }
    if (cal1 == '/') {
      cal1_string = '÷';
    }
    if (cal2 == '*') {
      cal2_string = '×';
    }
    if (cal2 == '/') {
      cal2_string = '÷';
    }

    calExpression_List1.add('(');
    calExpression_List1.add('($frac_x_numerator/$frac_x_denominator)');
    calExpression_List1.add('^$frac_x_power');
    calExpression_List1.add(cal1);
    calExpression_List1.add('($frac_y_numerator/$frac_y_denominator)');
    calExpression_List1.add('^$frac_y_power');
    calExpression_List1.add(')');
    calExpression_List1.add(cal2);
    calExpression_List1.add('($frac_z_numerator/$frac_z_denominator)');
    calExpression_List1.add('^$frac_z_power');

    // calExpression_List.add(cal3);
    // calExpression_List.add('($frac_w_numerator/$frac_w_denominator)');
    for (String string in calExpression_List1) {
      calExpression1 = calExpression1 + string;
    }

    calExpression_List2.add('($frac_x_numerator/$frac_x_denominator)');
    calExpression_List2.add('^$frac_x_power');
    calExpression_List2.add(cal1);
    calExpression_List2.add('(');
    calExpression_List2.add('($frac_y_numerator/$frac_y_denominator)');
    calExpression_List2.add('^$frac_y_power');
    calExpression_List2.add(cal2);
    calExpression_List2.add('($frac_z_numerator/$frac_z_denominator)');
    calExpression_List2.add('^$frac_z_power');
    calExpression_List2.add(')');

    for (String string in calExpression_List2) {
      calExpression2 = calExpression2 + string;
    }

    bool random_bool = Random().nextBool();

    realAnswer = random_bool
        ? MathNodeExpression.fromString(calExpression1).calc(0).toFraction()
        : MathNodeExpression.fromString(calExpression2).calc(0).toFraction();

    if (realAnswer.numerator.abs() >= 100 ||
        realAnswer.denominator.abs() >= 100) {
      resetNumber();
    }

    questionRow = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: random_bool
          ? [
              Text(
                '(',
                style: TextStyle(fontSize: 30.0),
              ),
              GeneralTermWidget(
                frac_x_numerator,
                frac_x_denominator,
                frac_x_power,
                fontsize: 30.0,
              ),
              Text(
                cal1_string,
                style: TextStyle(fontSize: 30.0),
              ),
              GeneralTermWidget(
                frac_y_numerator,
                frac_y_denominator,
                frac_y_power,
                fontsize: 30.0,
              ),
              Text(
                ')',
                style: TextStyle(fontSize: 30.0),
              ),
              Text(
                cal2_string,
                style: TextStyle(fontSize: 30.0),
              ),
              GeneralTermWidget(
                frac_z_numerator,
                frac_z_denominator,
                frac_z_power,
                fontsize: 30.0,
              ),
              Text(
                '=',
                style: TextStyle(fontSize: 30.0),
              ),
            ]
          : [
              GeneralTermWidget(
                frac_x_numerator,
                frac_x_denominator,
                frac_x_power,
                fontsize: 30.0,
              ),
              Text(
                cal1_string,
                style: TextStyle(fontSize: 30.0),
              ),
              Text(
                '(',
                style: TextStyle(fontSize: 30.0),
              ),
              GeneralTermWidget(
                frac_y_numerator,
                frac_y_denominator,
                frac_y_power,
                fontsize: 30.0,
              ),
              Text(
                cal2_string,
                style: TextStyle(fontSize: 30.0),
              ),
              GeneralTermWidget(
                frac_z_numerator,
                frac_z_denominator,
                frac_z_power,
                fontsize: 30.0,
              ),
              Text(
                ')',
                style: TextStyle(fontSize: 30.0),
              ),
              Text(
                '=',
                style: TextStyle(fontSize: 30.0),
              ),
            ],
    );

    choiceSet.add(realAnswer);

    while (choiceSet.length < 4) {
      choiceSet.add(
        Random().nextBool()
            ? Fraction(realAnswer.numerator + Random().nextInt(20) - 10,
                    realAnswer.denominator + Random().nextInt(5) + 1)
                .reduce()
            : Fraction((realAnswer.numerator + Random().nextInt(20) - 10) * -1,
                    realAnswer.denominator + Random().nextInt(5) + 1)
                .reduce(),
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
    checkBool = submittedAnswer == realAnswer ? true : false;
    checkBool ? correctCount++ : {};
    resetNumber();
  }
}
