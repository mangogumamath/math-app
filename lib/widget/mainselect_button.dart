import 'package:calculation_game/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainSelectbutton extends StatelessWidget {
  MainSelectbutton({required this.moveScreen, required this.list});

  Widget moveScreen;
  List<Widget> list;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: mainSelectButtonStyle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => moveScreen));
      },
    );
  }
}
