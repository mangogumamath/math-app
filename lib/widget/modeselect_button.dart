import 'package:calculation_game/constants.dart';
import 'package:flutter/material.dart';

class modeSelectbutton extends StatelessWidget {
  modeSelectbutton({required this.moveScreen, required this.text});

  Widget moveScreen;
  String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: modeSelectButtonStyle,
      child: Text(
        text,
        style: TextStyle(fontSize: 30.0),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => moveScreen));
      },
    );
  }
}
