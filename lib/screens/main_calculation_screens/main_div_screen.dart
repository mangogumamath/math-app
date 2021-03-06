import 'package:calculation_game/screens/practice_calcultion_screens/different_add_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/div_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/mul_many_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/mul_two_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/same_add_screen.dart';
import 'package:calculation_game/screens/tutorial/addtutorial_screen.dart';
import 'package:calculation_game/screens/tutorial/divtutorial_screen.dart';
import 'package:calculation_game/screens/tutorial/multutorial_screen.dart';
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
              moveScreen: DivScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
