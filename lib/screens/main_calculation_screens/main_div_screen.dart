import 'package:calculation_game/constants.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/practice_screen.dart';
import 'package:calculation_game/screens/tutorial/divtutorial_screen.dart';
import 'package:calculation_game/widget/modeselect_button.dart';
import 'package:flutter/material.dart';

class MainDivScreen extends StatefulWidget {
  @override
  _MainDivScreenState createState() => _MainDivScreenState();
}

class _MainDivScreenState extends State<MainDivScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나눗셈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            modeSelectbutton(
              text: '나눗셈 튜토리얼',
              moveScreen: DivTutorialScreen(),
            ),
            modeSelectbutton(
              text: '나눗셈',
              moveScreen: PracticeScreen(
                calculationType: CalculationType.division,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
