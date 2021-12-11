import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {Key? key,
      required this.color,
      required this.buttonText,
      required this.onPressed})
      : super(key: key);
  Color color;
  String buttonText;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.black, fontSize: 25.0),
          ),
        ),
      ),
    );
  }
}
