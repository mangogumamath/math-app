import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/calculation_brain.dart';
import 'package:calculation_game/screens/add_screen.dart';
import 'package:calculation_game/screens/different_add_screen.dart';
import 'package:calculation_game/screens/same_add_screen.dart';
import 'package:calculation_game/screens/tutorial_screen.dart';
import 'package:calculation_game/widget/modeselect_button.dart';
import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({Key? key}) : super(key: key);

  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          modeSelectbutton(
            text: '튜토리얼',
            moveScreen: TutorialScreen(),
          ),
          modeSelectbutton(
            text: '부호가 같은 두 수의 덧셈',
            moveScreen: SameAddScreen(),
          ),
          modeSelectbutton(
            text: '부호가 다른 두 수의 덧셈',
            moveScreen: DifferentAddScreen(),
          ),
          modeSelectbutton(
            text: '덧셈',
            moveScreen: AddScreen(),
          ),
          ElevatedButton(
            style: modeSelectButtonStyle,
            child: Text('곱셈'),
            onPressed: () {
              setState(() {});
            },
          ),
          ElevatedButton(
            style: modeSelectButtonStyle,
            child: Text('나눗셈'),
            onPressed: () {
              setState(() {});
            },
          ),
          ElevatedButton(
            style: modeSelectButtonStyle,
            child: Text('혼합 계산'),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
