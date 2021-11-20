import 'package:flutter/material.dart';

ButtonStyle modeSelectButtonStyle = ButtonStyle(
  // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10.0)),
  fixedSize: MaterialStateProperty.all<Size>(Size(200.0, 80.0)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03DAC5)),
);
ButtonStyle calculationButtonStyle = ButtonStyle(
  // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10.0)),
  fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(80.0)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03DAC5)),
);
