import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('로그인'),
        actions: [
          TextButton(
            child: Text(
              '확인',
              style: TextStyle(color: Color(0xffbb86fc), fontSize: 20.0),
            ),
            onPressed: () async {
              setState(() {
                showSpinner = true;
              });
              try {
                final userCredential = await _auth.signInWithEmailAndPassword(
                    email: email, password: password);
                if (userCredential.user != null) {
                  Provider.of<UserData>(context, listen: false)
                      .signInUserData(userCredential.user!);
                }

                setState(() {
                  showSpinner = false;
                });
                Navigator.pop(context);
              } catch (e) {
                print(e);
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                    style: kTextFieldTextStyle,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: '이메일',
                      icon: const FaIcon(
                        FontAwesomeIcons.solidEnvelope,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    )),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    style: kTextFieldTextStyle,
                    obscureText: true,
                    obscuringCharacter: '*',
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: '비밀번호',
                      icon: const FaIcon(
                        FontAwesomeIcons.key,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    )),
                SizedBox(
                  height: 24.0,
                ),
                // RoundedButton(
                //   color: Color(0xffbb86fc),
                //   buttonText: '로그인',
                //   onPressed: () async {
                //     setState(() {
                //       showSpinner = true;
                //     });
                //     try {
                //       final userCredential =
                //           await _auth.signInWithEmailAndPassword(
                //               email: email, password: password);
                //       if (userCredential.user != null) {
                //         Provider.of<UserData>(context, listen: false)
                //             .signInUserData(userCredential.user!);
                //       }
                //
                //       setState(() {
                //         showSpinner = false;
                //       });
                //     } catch (e) {
                //       print(e);
                //     }
                //     Navigator.pop(context);
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
