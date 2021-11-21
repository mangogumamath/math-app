import 'package:calculation_game/screens/practice_calcultion_screens/different_add_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/mul_many_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/mul_two_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/same_add_screen.dart';
import 'package:calculation_game/screens/tutorial/addtutorial_screen.dart';
import 'package:calculation_game/screens/tutorial/multutorial_screen.dart';
import 'package:calculation_game/widget/modeselect_button.dart';
import 'package:flutter/material.dart';

class MainMulScreen extends StatefulWidget {
  @override
  _MainMulScreenState createState() => _MainMulScreenState();
}

class _MainMulScreenState extends State<MainMulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('곱셈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            modeSelectbutton(
              text: '곱셈 튜토리얼',
              moveScreen: MulTutorialScreen(),
            ),
            modeSelectbutton(
              text: '두 수의 곱셈',
              moveScreen: MulTwoScreen(),
            ),
            modeSelectbutton(
              text: '세 개 이상의 수의 곱셈',
              moveScreen: MulManyScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
