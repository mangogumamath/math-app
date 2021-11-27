import 'package:calculation_game/constants.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/mix_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/practice_screen.dart';
import 'package:calculation_game/screens/tutorial/mixtutorial_screen.dart';
import 'package:calculation_game/widget/modeselect_button.dart';
import 'package:flutter/material.dart';

class MainMixScreen extends StatefulWidget {
  @override
  _MainMixScreenState createState() => _MainMixScreenState();
}

class _MainMixScreenState extends State<MainMixScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('혼합 계산'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            modeSelectbutton(
              text: '혼합 계산 튜토리얼',
              moveScreen: MixTutorialScreen(),
            ),
            modeSelectbutton(
              text: '혼합 계산',
              moveScreen: PracticeScreen(
                calculationType: CalculationType.mix,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
