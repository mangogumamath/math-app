import 'package:calculation_game/model/admob.dart';
import 'package:calculation_game/model/user_data.dart';
import 'package:calculation_game/screens/calculation_main_screen.dart';
import 'package:calculation_game/screens/leaderboard_screen.dart';
import 'package:calculation_game/screens/my_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  runApp(const CalculationGame());
}

class CalculationGame extends StatefulWidget {
  const CalculationGame({Key? key}) : super(key: key);

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
    return ChangeNotifierProvider<UserData>(
      create: (_) {
        return UserData();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '무한의 계산',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff121212),
          fontFamily: 'ONEMobilePOP',
          // brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(
            primary: Color(0xffbb86fc),
            primaryVariant: Color(0xff3700B3),
            secondary: Color(0xff03dac6),
            secondaryVariant: Color(0xff03dac6),
            surface: Color(0xff1E1E1E),
            background: Color(0xff121212),
            error: Color(0xffcf6679),
            onPrimary: Colors.black,
            onSecondary: Colors.black,
            onSurface: Colors.white,
            onBackground: Colors.white,
            onError: Colors.black,
            brightness: Brightness.dark,
          ),
        ),

        //ThemeData.dark().copyWith(
        //           textTheme: TextTheme(
        //             headline1: TextStyle(fontFamily: fontFamily),
        //             subtitle1: TextStyle(fontFamily: fontFamily),
        //             bodyText1: TextStyle(fontFamily: fontFamily),
        //             bodyText2: TextStyle(fontFamily: fontFamily),
        //             subtitle2: TextStyle(fontFamily: fontFamily),
        //             button: TextStyle(fontFamily: fontFamily),
        //             headline2: TextStyle(fontFamily: fontFamily),
        //             caption: TextStyle(fontFamily: fontFamily),
        //             overline: TextStyle(fontFamily: fontFamily),
        //             headline3: TextStyle(fontFamily: fontFamily),
        //             headline4: TextStyle(fontFamily: fontFamily),
        //             headline5: TextStyle(fontFamily: fontFamily),
        //             headline6: TextStyle(fontFamily: fontFamily),
        //           ),
        //           // buttonTheme: ButtonThemeData(buttonColor: Color(0xFF03DAC5)),
        //         ),
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const Center(child: Text('무한의 계산')),
              ),
// TabBarView
              body: IndexedStack(
                index: _widgetIndex,
                children: [
// HomeScreen(),
                  CalculationMainScreen(),
                  LeaderBoardScreen(),
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
                      tabs: const [
                        Tab(
                          icon: Icon(
                            Icons.calculate_rounded,
                            size: 30.0,
                          ),
// text: 'chat',
                        ),
                        Tab(
                          icon: FaIcon(
                            FontAwesomeIcons.crown,
                            size: 25.0,
                          ),
                          // text: '홈',
                        ),
                        Tab(
                          icon: Icon(
                            Icons.person,
                            size: 30.0,
                          ),
// text: 'my',
                        ),
                      ]),
                ],
              ),
            )),
      ),
    );
  }
}
