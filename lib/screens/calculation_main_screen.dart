import 'package:calculation_game/model/admob.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_add_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_addsub_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_div_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_mix_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_mul_screen.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_sub_screen.dart';
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
      child: ListView(
        // scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          // adMob.adContainer,
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              '계산 유형 선택',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ReusableCard(
            colour: const Color(0xff1E1E1E),
            cardChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.plus,
                      size: 25.0,
                    ),
                    Text(
                      ' 덧셈',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 25.0,
                ),
              ],
            ),
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainAddScreen()));
            },
          ),
          ReusableCard(
            colour: const Color(0xff1E1E1E),
            cardChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.minus,
                      size: 25.0,
                    ),
                    Text(
                      ' 뺄셈',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 25.0,
                ),
              ],
            ),
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainSubScreen()));
            },
          ),
          ReusableCard(
            colour: const Color(0xff1E1E1E),
            cardChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.plus,
                      size: 25.0,
                    ),
                    Text(
                      ' ',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    FaIcon(
                      FontAwesomeIcons.minus,
                      size: 25.0,
                    ),
                    Text(
                      ' 덧셈과 뺄셈',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 25.0,
                ),
              ],
            ),
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainAddSubScreen()));
            },
          ),
          ReusableCard(
            colour: const Color(0xff1E1E1E),
            cardChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.times,
                      size: 25.0,
                    ),
                    Text(
                      ' 곱셈',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 25.0,
                ),
              ],
            ),
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainMulScreen()));
            },
          ),
          ReusableCard(
            colour: const Color(0xff1E1E1E),
            cardChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.divide,
                      size: 25.0,
                    ),
                    Text(
                      ' 나눗셈',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 25.0,
                ),
              ],
            ),
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainDivScreen()));
            },
          ),
          ReusableCard(
            colour: const Color(0xff1E1E1E),
            cardChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.calculate_rounded,
                      size: 25.0,
                    ),
                    Text(
                      ' 혼합 계산',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 25.0,
                ),
              ],
            ),
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainMixScreen()));
            },
          ),
        ],
      ),
    );
  }
}
