import 'package:flutter/material.dart';

//계산 종류
enum CalculationType {
  sameAdd,
  diffAdd,
  subtraction,
  addSub,
  multiplicationTwo,
  multiplicationMany,
  division,
  mix
}
//메인 화면 버튼 스타일
ButtonStyle mainSelectButtonStyle = ButtonStyle(
  // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10.0)),
  fixedSize: MaterialStateProperty.all<Size>(Size(200.0, 80.0)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03DAC5)),
);

//튜토리얼, 모드 선택 등의 버튼 스타일
ButtonStyle modeSelectButtonStyle = ButtonStyle(
  // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10.0)),
  // fixedSize: MaterialStateProperty.all<Size>(Size(200.0, 80.0)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03DAC5)),
);

//답 선택 버튼 스타일
ButtonStyle calculationButtonStyle = ButtonStyle(
  // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10.0)),
  fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(80.0)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03DAC5)),
);
