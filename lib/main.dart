import 'package:calculation_game/constants.dart';
import 'package:calculation_game/screens/calculation_main_screen.dart';
import 'package:calculation_game/screens/my_screen.dart';
import 'package:calculation_game/model/adMob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(CalculationGame());
}

class CalculationGame extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<CalculationGame> createState() => _CalculationGameState();
}

class _CalculationGameState extends State<CalculationGame> {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '무한의 계산',
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          headline1: TextStyle(fontFamily: fontFamily),
          subtitle1: TextStyle(fontFamily: fontFamily),
          bodyText1: TextStyle(fontFamily: fontFamily),
          bodyText2: TextStyle(fontFamily: fontFamily),
          subtitle2: TextStyle(fontFamily: fontFamily),
          button: TextStyle(fontFamily: fontFamily),
          headline2: TextStyle(fontFamily: fontFamily),
          caption: TextStyle(fontFamily: fontFamily),
          overline: TextStyle(fontFamily: fontFamily),
          headline3: TextStyle(fontFamily: fontFamily),
          headline4: TextStyle(fontFamily: fontFamily),
          headline5: TextStyle(fontFamily: fontFamily),
          headline6: TextStyle(fontFamily: fontFamily),
        ),
        buttonTheme: ButtonThemeData(buttonColor: Color(0xFF03DAC5)),
      ),
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('무한의 계산'),
            ),
// TabBarView
            body: IndexedStack(
              index: _widgetIndex,
              children: [
// HomeScreen(),
                CalculationMainScreen(),
                MyScreen(),
              ],
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
// indicatorColor: Colors.deepPurpleAccent,
                    onTap: (index) {
                      {
                        setState(() {
                          _widgetIndex = index;
                        });
                      }
                    },
                    tabs: [
// Tab(
//   icon: Icon(Icons.home),
//   // text: '홈',
// ),
                      Tab(
                        icon: Icon(Icons.calculate_rounded),
// text: 'chat',
                      ),
                      Tab(
                        icon: Icon(Icons.person),
// text: 'my',
                      ),
                    ]),
              ],
            ),
          )),
    );
  }
}
