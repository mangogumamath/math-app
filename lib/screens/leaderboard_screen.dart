import 'dart:async';

import 'package:calculation_game/model/admob.dart';
import 'package:calculation_game/model/user_data.dart';
import 'package:calculation_game/widget/reusable_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  String nickName = '';
  Map<String, dynamic> _userDataMap = {};
  int userRanking = 0;
  int userHighScoreOfAll = 0;
  Map rankerMap = {};

  bool isLoadRankerButtonDisabled = false;

  // final _auth = FirebaseAuth.instance;

  // void _loadScore() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _maxScore = (prefs.getInt('maxScore') ?? 0);
  //   });
  // }

  AdMob adMob = AdMob();

  final scrollController = ScrollController();

  Future<void> loadRanker() async {
    try {
      rankerMap = {};
      await FirebaseFirestore.instance
          .collection('UserData')
          .orderBy('userHighScoreOfAll', descending: true)
          .limit(100)
          .get()
          .then((QuerySnapshot querySnapshot) {
        int _counter = 0;
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          _counter++;
          final queryUserMap =
              queryDocumentSnapshot.data() as Map<String, dynamic>;
          rankerMap['$_counter'] = queryUserMap;
        }
      });
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  FaIcon topRankerIcon(int rank) {
    if (rank == 1) {
      return const FaIcon(
        FontAwesomeIcons.crown,
        size: 25.0,
        color: Colors.amberAccent,
      );
    } else if (rank == 2) {
      return const FaIcon(
        FontAwesomeIcons.crown,
        size: 25.0,
        color: Colors.white70,
      );
    } else if (rank == 3) {
      return const FaIcon(
        FontAwesomeIcons.crown,
        size: 25.0,
        color: Colors.brown,
      );
    } else {
      return const FaIcon(
        FontAwesomeIcons.chessPawn,
        size: 0.0,
        color: Colors.white,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adMob.myBanner.load();
    loadRanker();
  }

  @override
  Widget build(BuildContext context) {
    _userDataMap = Provider.of<UserData>(context).userDataMap;
    nickName = _userDataMap['nickName'];
    userRanking = Provider.of<UserData>(context).userRanking;
    userHighScoreOfAll = _userDataMap['userHighScoreOfAll'];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          adMob.adContainer,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                ' ' + nickName,
                                style: const TextStyle(fontSize: 25.0),
                                // overflow: TextOverflow.clip,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                ' ' +
                                    userRanking.toString() +
                                    ' 위' +
                                    '   ' +
                                    userHighScoreOfAll.toString() +
                                    ' 점',
                                style: const TextStyle(fontSize: 20.0),
                                // overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SizedBox(),
            const Text(
              '1위~100위',
              style: TextStyle(fontSize: 25.0),
            ),
            ElevatedButton(
              onPressed: isLoadRankerButtonDisabled
                  ? null
                  : () async {
                      isLoadRankerButtonDisabled = true;
                      setState(() {});
                      loadRanker();
                      Future.delayed(const Duration(seconds: 5), () {
                        isLoadRankerButtonDisabled = false;
                        setState(() {});
                      });
                    },
              child: const FaIcon(
                FontAwesomeIcons.syncAlt,
                size: 25.0,
              ),
            ),
          ]),

          Expanded(
            child: Scrollbar(
              controller: scrollController,
              isAlwaysShown: true,
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(8.0),
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> empty = {
                    'nickName': '',
                    'userHighScoreOfAll': ''
                  };
                  Map<String, dynamic> ranker =
                      rankerMap['${index + 1}'] ?? empty;
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${index + 1} 위 ',
                              style: const TextStyle(fontSize: 30.0),
                            ),
                            topRankerIcon(index + 1),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ranker.containsKey('nickName')
                                  ? ranker['nickName']
                                  : 'unknown',
                              style: const TextStyle(fontSize: 25.0),
                            ),
                            Text(
                              ranker.containsKey('userHighScoreOfAll')
                                  ? ranker['userHighScoreOfAll'].toString() +
                                      ' 점'
                                  : 'unknown',
                              style: const TextStyle(fontSize: 25.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
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
