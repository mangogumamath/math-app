import 'package:calculation_game/constants.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/different_add_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/practice_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/same_add_screen.dart';
import 'package:calculation_game/screens/tutorial/addtutorial_screen.dart';
import 'package:calculation_game/widget/modeselect_button.dart';
import 'package:flutter/material.dart';

class MainAddScreen extends StatefulWidget {
  @override
  _MainAddScreenState createState() => _MainAddScreenState();
}

class _MainAddScreenState extends State<MainAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('덧셈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            modeSelectbutton(
              text: '덧셈 튜토리얼',
              moveScreen: AddTutorialScreen(),
            ),
            modeSelectbutton(
              text: '부호가 같은 두 수의 덧셈',
              moveScreen: PracticeScreen(
                calculationType: CalculationType.sameAdd,
              ),
            ),
            modeSelectbutton(
              text: '부호가 다른 두 수의 덧셈',
              moveScreen: PracticeScreen(
                calculationType: CalculationType.diffAdd,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
