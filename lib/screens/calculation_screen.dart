import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/calculation_brain.dart';
import 'package:calculation_game/screens/add_screen.dart';
import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({Key? key}) : super(key: key);

  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: calculationButtonStyle,
            child: Text('부호가 같은 수의 덧셈'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddScreen()));
            },
          ),
          ElevatedButton(
            style: calculationButtonStyle,
            child: Text('부호가 다른 수의 덧셈'),
            onPressed: () {
              setState(() {});
            },
          ),
          ElevatedButton(
            style: calculationButtonStyle,
            child: Text('곱셈'),
            onPressed: () {
              setState(() {});
            },
          ),
          ElevatedButton(
            style: calculationButtonStyle,
            child: Text('나눗셈'),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
