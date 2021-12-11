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
    // maximumSize: MaterialStateProperty.all<Size>(Size(200.0, 70.0)),
    // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10.0)),

    // fixedSize: MaterialStateProperty.all<Size>(Size(200.0, 80.0)),
    // foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    // backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03DAC5)),
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
  // foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
  // backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03DAC5)),
);

//텍스트필드 textstyle
TextStyle kTextFieldTextStyle =
    const TextStyle(color: Colors.white, fontSize: 20.0);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter your email',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  // enabledBorder: OutlineInputBorder(
  //   borderSide: BorderSide(color: Color(0xffbb86fc), width: 1.0),
  //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
  // ),
  // focusedBorder: OutlineInputBorder(
  //   borderSide: BorderSide(color: Color(0xffbb86fc), width: 2.0),
  //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
  // ),
);

const kScoreTileTextStyle = TextStyle(
  fontSize: 20.0,
);

// const kSendButtonTextStyle = TextStyle(
//   color: Colors.lightBlueAccent,
//   fontWeight: FontWeight.bold,
//   fontSize: 18.0,
// );
//
// const kMessageTextFieldDecoration = InputDecoration(
//   contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//   hintText: 'Type your message here...',
//   border: InputBorder.none,
// );
//
// const kMessageContainerDecoration = BoxDecoration(
//   border: Border(
//     top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//   ),
// );
//색상들
