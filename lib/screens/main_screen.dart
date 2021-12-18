import 'package:calculation_game/model/admob.dart';
import 'package:calculation_game/model/user_data.dart';
import 'package:calculation_game/screens/calculation_main_screen.dart';
import 'package:calculation_game/screens/leaderboard_screen.dart';
import 'package:calculation_game/screens/my_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adMob.myBanner.load();
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
                        size: 25.0,
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
