import 'package:calculation_game/screens/practice_calcultion_screens/addsub_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/different_add_screen.dart';
import 'package:calculation_game/screens/practice_calcultion_screens/same_add_screen.dart';
import 'package:calculation_game/screens/tutorial/addsubtutorial_screen.dart';
import 'package:calculation_game/screens/tutorial/addtutorial_screen.dart';
import 'package:calculation_game/widget/modeselect_button.dart';
import 'package:flutter/material.dart';

class MainAddSubScreen extends StatefulWidget {
  @override
  _MainAddSubScreenState createState() => _MainAddSubScreenState();
}

class _MainAddSubScreenState extends State<MainAddSubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('덧셈과 뺄셈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            modeSelectbutton(
              text: '괄호와 양의 부호 생략\n튜토리얼',
              moveScreen: AddSubTutorialScreen(),
            ),
            modeSelectbutton(
              text: '덧셈과 뺄셈',
              moveScreen: AddSubScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
