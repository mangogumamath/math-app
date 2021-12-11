import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/user_data.dart';
import 'package:calculation_game/widget/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = '/registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  String nickName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('사용자 등록'),
        actions: [
          TextButton(
            child: Text(
              '확인',
              style: TextStyle(color: Color(0xffbb86fc), fontSize: 20.0),
            ),
            onPressed: () async {
              if (password.length < 6) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      '6자리 이상의 비밀번호를 설정해주세요.',
                      style: TextStyle(fontFamily: 'ONEMobilePOP'),
                    ),
                    action: SnackBarAction(label: '확인', onPressed: () {}),
                  ),
                );
                return;
              }

              setState(() {
                showSpinner = true;
              });
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);

                if (newUser != null) {
                  print('new User exist');
                  if (newUser.user != null) {
                    final time = Timestamp.now();
                    final registrationTimestamp =
                        DateTime.fromMicrosecondsSinceEpoch(
                            time.microsecondsSinceEpoch);
                    Provider.of<UserData>(context, listen: false)
                            .userDataMap['registrationTimestamp'] =
                        registrationTimestamp;

                    final uid = newUser.user!.uid;
                    FirebaseFirestore.instance
                        .collection('UserData')
                        .doc(uid)
                        .set({
                          'uid': uid,
                          'email': email,
                          'nickName': nickName,
                          'registrationTimestamp': registrationTimestamp,
                        }, SetOptions(merge: true))
                        .then((value) =>
                            print("Score merged with existing data!"))
                        .catchError(
                            (error) => print("Failed to merge data: $error"));
                  }
                }
                setState(() {
                  showSpinner = false;
                });
                Navigator.pop(context);
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
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
                      hintText: '6자리 이상의 비밀번호',
                      icon: const FaIcon(
                        FontAwesomeIcons.key,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    )),
                SizedBox(
                  height: 24.0,
                ),
                TextField(
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
                SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
