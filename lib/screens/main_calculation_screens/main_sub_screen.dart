import 'package:calculation_game/constants.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/practice_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/sub_screen.dart';
import 'package:calculation_game/screens/tutorial/subtutorial_screen.dart';
import 'package:calculation_game/widget/modeselect_button.dart';
import 'package:flutter/material.dart';

class MainSubScreen extends StatefulWidget {
  @override
  _MainSubScreenState createState() => _MainSubScreenState();
}

class _MainSubScreenState extends State<MainSubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('뺄셈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            modeSelectbutton(
              text: '뺄셈 튜토리얼',
              moveScreen: SubTutorialScreen(),
            ),
            modeSelectbutton(
              text: '뺄셈',
              moveScreen: PracticeScreen(
                calculationType: CalculationType.subtraction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
