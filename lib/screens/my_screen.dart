import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text('로그인'),
          Text(
            '본 앱은 정수와 유리수의 계산을 연습하기 위해 만들어졌습니다.',
            style: TextStyle(fontSize: 40.0),
          ),
          Text(
            '기능 준비중',
            style: TextStyle(fontSize: 40.0),
          ),
        ],
      ),
    );
  }
}
