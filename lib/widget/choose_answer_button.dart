import 'package:calculation_game/constants.dart';
import 'package:flutter/material.dart';

class ChooseAnswerButton extends StatelessWidget {
  ChooseAnswerButton(
      {String? buttonText,
      Widget? buttonChild,
      bool? isDisabled,
      double? fontsize,
      void Function()? onPressed}) {
    this.buttonText = buttonText ?? '';
    this.buttonChild = buttonChild ?? SizedBox();
    this.fontsize = fontsize ?? 45.0;
    this.onPressed = onPressed ?? () {};
    this.isDisabled = isDisabled ?? false;
  }
  bool isDisabled = false;
  String buttonText = '';
  Widget buttonChild = SizedBox();
  double fontsize = 45.0;
  void Function() onPressed = () {};

  @override
  Widget build(BuildContext context) {
    //buttonText가 ''이 아니면 항상 Text 위젯을 리턴함.
    if (buttonText != '') {
      buttonChild = Text(
        buttonText,
        style: TextStyle(fontSize: fontsize),
      );
    }

    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: calculationButtonStyle,
          child: buttonChild,
          onPressed: isDisabled ? null : onPressed,
        ),
      ),
    );
  }
}
