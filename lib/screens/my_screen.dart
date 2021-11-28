import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/adMob.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  int _maxScore = 0;

  void _loadScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _maxScore = (prefs.getInt('maxScore') ?? 0);
    });
  }

  AdMob adMob = AdMob();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadScore();
    adMob.myBanner.load();
  }

  Future<void> _removeScore() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('maxScore');
  }

  @override
  Widget build(BuildContext context) {
    _loadScore();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          adMob.adContainer,
          SizedBox(
            height: 120.0,
          ),
          Text(
            '최고점수: \n' + _maxScore.toString() + ' 점',
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.amber,
            ),
          ),

          //최고점수 삭제 버튼
          // ElevatedButton(
          //     onPressed: _removeScore, child: FaIcon(FontAwesomeIcons.eraser)),
          // Text('로그인'),
          // Text(
          //   '본 앱은 정수와 유리수의 계산을 연습하기 위해 만들어졌습니다.',
          //   style: TextStyle(fontSize: 40.0),
          // ),
          // Text(
          //   '기능 준비중',
          //   style: TextStyle(fontSize: 40.0),
          // ),
        ],
      ),
    );
  }
}
