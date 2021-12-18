import 'package:calculation_game/model/user_data.dart';
import 'package:calculation_game/screens/first_login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        home: const FirstLoginScreen(),
      ),
    );
  }
}
