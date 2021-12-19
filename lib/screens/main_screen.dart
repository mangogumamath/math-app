import 'package:calculation_game/model/admob.dart';
import 'package:calculation_game/model/user_data.dart';
import 'package:calculation_game/screens/calculation_main_screen.dart';
import 'package:calculation_game/screens/leaderboard_screen.dart';
import 'package:calculation_game/screens/my_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String fontFamily = 'ONEMobilePOP';

  int _widgetIndex = 0;

  AdMob adMob = AdMob();

  String nickName = '';

  Future<void> nickNameNullCheck() async {
    if (Provider.of<UserData>(context, listen: false).userDataMap['nickName'] ==
        '') {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            '닉네임 설정',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          content: TextField(
              style: kTextFieldTextStyle,
              keyboardType: TextInputType.name,
              textAlign: TextAlign.center,
              onChanged: (value) {
                nickName = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: '닉네임',
                icon: const FaIcon(
                  FontAwesomeIcons.solidSmile,
                  color: Colors.white,
                  size: 25.0,
                ),
              )),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text(
                '취소',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Change'),
              child: const Text(
                '설정',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ).then((returnVal) async {
        if (returnVal == 'Change') {
          try {
            Provider.of<UserData>(context, listen: false)
                .userDataMap['nickName'] = nickName;
            final uid = Provider.of<UserData>(context, listen: false)
                .userDataMap['uid'];
            await FirebaseFirestore.instance
                .collection('UserData')
                .doc(uid)
                .set({
                  'nickName': nickName,
                }, SetOptions(merge: true))
                .then((value) => print("Score merged with existing data!"))
                .catchError((error) => print("Failed to merge data: $error"));

            Provider.of<UserData>(context, listen: false).justNotify();
          } catch (e) {
            print(e);
          }
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adMob.myBanner.load();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      nickNameNullCheck();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            // appBar: AppBar(
            //   title: const Center(child: Text('무한의 계산')),
            // ),
// TabBarView
            body: IndexedStack(
              index: _widgetIndex,
              children: const [
                CalculationMainScreen(),
                LeaderBoardScreen(),
                MyScreen(),
                // TestPage(),
              ],
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.end,
              children: [
                adMob.adContainer,
                TabBar(
// indicatorColor: Colors.deepPurpleAccent,
                  onTap: (index) {
                    {
                      setState(() {
                        _widgetIndex = index;
                      });
                    }
                  },
                  tabs: const [
                    Tab(
                      icon: Icon(
                        Icons.calculate_rounded,
                        size: 30.0,
                      ),
                      // text: '계산',
                    ),
                    Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.crown,
                        size: 20.0,
                      ),
                      // text: '순위',
                    ),
                    Tab(
                      icon: Icon(
                        Icons.person,
                        size: 30.0,
                      ),
                      // text: '내 정보',
                    ),
//                         Tab(
//                           icon: Icon(
//                             Icons.person,
//                             size: 30.0,
//                           ),
// // text: 'my',
//                         ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
