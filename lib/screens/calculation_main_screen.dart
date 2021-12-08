import 'package:calculation_game/model/admob.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_add_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_addsub_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_div_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_mix_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_mul_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_sub_screen.dart';
import 'package:calculation_game/widget/mainselect_button.dart';
import 'package:calculation_game/widget/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculationMainScreen extends StatefulWidget {
  @override
  _CalculationMainScreenState createState() => _CalculationMainScreenState();
}

class _CalculationMainScreenState extends State<CalculationMainScreen> {
  AdMob adMob = AdMob();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adMob.myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.plus,
                    size: 25.0,
                  ),
                  Text(
                    '덧셈',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ],
              ),
            ),
            ReusableCard(
              cardChild: MainSelectbutton(
                list: [],
                moveScreen: MainAddScreen(),
              ),
            ),
            MainSelectbutton(
              list: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.minus,
                      size: 25.0,
                    ),
                  ],
                ),
                Text(
                  '뺄셈',
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
              moveScreen: MainSubScreen(),
            ),
            MainSelectbutton(
              list: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.plus,
                      size: 25.0,
                    ),
                    FaIcon(
                      FontAwesomeIcons.minus,
                      size: 25.0,
                    ),
                  ],
                ),
                Text(
                  '덧셈과 뺄셈',
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
              moveScreen: MainAddSubScreen(),
            ),
            MainSelectbutton(
              list: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.times,
                      size: 25.0,
                    ),
                  ],
                ),
                Text(
                  '곱셈',
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
              moveScreen: MainMulScreen(),
            ),
            MainSelectbutton(
              list: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.divide,
                      size: 25.0,
                    ),
                  ],
                ),
                Text(
                  '나눗셈',
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
              moveScreen: MainDivScreen(),
            ),
            MainSelectbutton(
              list: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.divide,
                      size: 25.0,
                    ),
                  ],
                ),
                Text(
                  '혼합 계산',
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
              moveScreen: MainMixScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
