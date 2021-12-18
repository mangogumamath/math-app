import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/admob.dart';
import 'package:calculation_game/model/user_data.dart';
import 'package:calculation_game/screens/userconfig_screen.dart';
import 'package:calculation_game/widget/reusable_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String nickName = '';
  Map<String, dynamic> _userDataMap = {};
  int userRanking = 0;

  final _auth = FirebaseAuth.instance;

  // void _loadScore() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _maxScore = (prefs.getInt('maxScore') ?? 0);
  //   });
  // }

  AdMob adMob = AdMob();

  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adMob.myBanner.load();
  }

  Future<void> _removeScore() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('maxScore');
  }

  @override
  Widget build(BuildContext context) {
    _userDataMap = Provider.of<UserData>(context).userDataMap;
    nickName = Provider.of<UserData>(context).userDataMap['nickName'];
    userRanking = Provider.of<UserData>(context).userRanking;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          // adMob.adContainer,
          const SizedBox(
            height: 10.0,
          ),
          ReusableCard(
            colour: const Color(0xff1E1E1E),
            cardChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.solidUserCircle,
                        size: 30.0,
                      ),
                      Flexible(
                        child: Text(
                          ' ' + nickName,
                          style: const TextStyle(fontSize: 25.0),
                          // overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 25.0,
                ),
              ],
            ),
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserConfigScreen()));
            },
          ),

          Expanded(
            child: Scrollbar(
              controller: scrollController,
              isAlwaysShown: true,
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(8.0),
                children: ListTile.divideTiles(context: context, tiles: [
                  ListTile(
                    title: Text(
                      '내 순위: ' + userRanking.toString() + ' 위',
                      style: kScoreTileTextStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '최고 점수 합계: ' +
                          _userDataMap['userHighScoreOfAll'].toString() +
                          ' 점',
                      style: kScoreTileTextStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '부호가 같은 덧셈: ' +
                          _userDataMap['sameAddHighScore'].toString() +
                          ' 점',
                      style: kScoreTileTextStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '부호가 다른 덧셈: ' +
                          _userDataMap['diffAddHighScore'].toString() +
                          ' 점',
                      style: kScoreTileTextStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '뺄셈: ' +
                          _userDataMap['subtractionHighScore'].toString() +
                          ' 점',
                      style: kScoreTileTextStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '덧셈과 뺄셈: ' +
                          _userDataMap['addSubHighScore'].toString() +
                          ' 점',
                      style: kScoreTileTextStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '두 수의 곱셈: ' +
                          _userDataMap['multiplicationTwoHighScore']
                              .toString() +
                          ' 점',
                      style: kScoreTileTextStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '세 수 이상의 곱셈: ' +
                          _userDataMap['multiplicationManyHighScore']
                              .toString() +
                          ' 점',
                      style: kScoreTileTextStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '나눗셈: ' +
                          _userDataMap['divisionHighScore'].toString() +
                          ' 점',
                      style: kScoreTileTextStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '혼합 계산: ' +
                          _userDataMap['mixHighScore'].toString() +
                          ' 점',
                      style: kScoreTileTextStyle,
                    ),
                  ),
                ]).toList(),
              ),
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
