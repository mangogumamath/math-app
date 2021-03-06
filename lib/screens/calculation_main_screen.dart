import 'package:calculation_game/constants.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_div_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_mix_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_mul_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_add_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_addsub_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_sub_screen.dart';
import 'package:calculation_game/widget/mainselect_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class CalculationMainScreen extends StatefulWidget {
  @override
  _CalculationMainScreenState createState() => _CalculationMainScreenState();
}

class _CalculationMainScreenState extends State<CalculationMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MainSelectbutton(
            list: [
              FaIcon(
                FontAwesomeIcons.plus,
                size: 30.0,
              ),
              Text(
                'λ§μ',
                style: TextStyle(fontSize: 30.0),
              ),
            ],
            moveScreen: MainAddScreen(),
          ),
          MainSelectbutton(
            list: [
              FaIcon(
                FontAwesomeIcons.minus,
                size: 30.0,
              ),
              Text(
                'λΊμ',
                style: TextStyle(fontSize: 30.0),
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
                    size: 30.0,
                  ),
                  FaIcon(
                    FontAwesomeIcons.minus,
                    size: 30.0,
                  ),
                ],
              ),
              Text(
                'λ§μκ³Ό λΊμ',
                style: TextStyle(fontSize: 30.0),
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
                    size: 30.0,
                  ),
                ],
              ),
              Text(
                'κ³±μ',
                style: TextStyle(fontSize: 30.0),
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
                    size: 30.0,
                  ),
                ],
              ),
              Text(
                'λλμ',
                style: TextStyle(fontSize: 30.0),
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
                    size: 30.0,
                  ),
                ],
              ),
              Text(
                'νΌν© κ³μ°',
                style: TextStyle(fontSize: 30.0),
              ),
            ],
            moveScreen: MainMixScreen(),
          ),
        ],
      ),
    );
  }
}
