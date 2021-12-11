import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/user_data.dart';
import 'package:calculation_game/screens/login_screen.dart';
import 'package:calculation_game/screens/registration_screen.dart';
import 'package:calculation_game/screens/userdelete_screen.dart';
import 'package:calculation_game/screens/userpassword_update_screen.dart';
import 'package:calculation_game/widget/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UserConfigScreen extends StatefulWidget {
  const UserConfigScreen({Key? key}) : super(key: key);

  @override
  _UserConfigScreenState createState() => _UserConfigScreenState();
}

class _UserConfigScreenState extends State<UserConfigScreen> {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;
  bool showSpinner = false;
  String email = '';
  String password = '';
  String nickName = '';
  bool _isLogin = false;

  @override
  Widget build(BuildContext context) {
    _isLogin = Provider.of<UserData>(context).isLogin;
    return Scaffold(
      appBar: AppBar(
        title: const Text('계정 정보'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              enabled: !_isLogin,
              title: Text(
                '로그인',
                style: TextStyle(fontSize: 25.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            ListTile(
              title: Text(
                '사용자 등록',
                style: TextStyle(fontSize: 25.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
              },
            ),
            ListTile(
              title: Text(
                '비밀번호 변경',
                style: TextStyle(fontSize: 25.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserPasswordUpdateScreen()),
                );
              },
            ),
            ListTile(
              enabled: _isLogin,
              title: Text(
                '로그아웃',
                style: TextStyle(fontSize: 25.0),
              ),
              onTap: () {
                _auth.signOut();
// Provider.of<UserData>(context, listen: false)
//     .signOutUserData();
              },
            ),
            const Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            ListTile(
              enabled: _isLogin,
              title: Text(
                '닉네임 변경',
                style: TextStyle(fontSize: 25.0),
              ),
              onTap: () {
// Provider.of<UserData>(context, listen: false)
//     .signOutUserData();
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      '닉네임 변경',
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
                          '변경',
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
                      FirebaseFirestore.instance
                          .collection('UserData')
                          .doc(uid)
                          .set({
                            'nickName': nickName,
                          }, SetOptions(merge: true))
                          .then((value) =>
                              print("Score merged with existing data!"))
                          .catchError(
                              (error) => print("Failed to merge data: $error"));

                      setState(() {
                        showSpinner = false;
                      });
                      Provider.of<UserData>(context, listen: false)
                          .justNotify();
                    } catch (e) {
                      print(e);
                    }
                  }
                });
              },
            ),
            const Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            ListTile(
              enabled: _isLogin,
              title: Text(
                '계정 삭제',
                style: TextStyle(fontSize: 25.0),
              ),
              onTap: () {
                // The function showDialog<T> returns Future<T>.
                // Use Navigator.pop() to return value (of type T).
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      '계정 삭제',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    content: const Text(
                      '계정이 완전히 삭제됩니다.'
                      '\n계속하려면 버튼을 눌러 아이디와 비밀번호를 입력하세요.',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text(
                          '취소',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Delete'),
                        child: const Text(
                          '계속',
                          style: TextStyle(fontSize: 20.0, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ).then((returnVal) {
                  if (returnVal == 'Delete') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserDeleteScreen()),
                    );
                  }
                });
// Provider.of<UserData>(context, listen: false)
//     .signOutUserData();
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Column(
// children: [
// ListTile(
// title: Text(''),
// ),
// ElevatedButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => RegistrationScreen()),
// );
// },
// child: Text('사용자 등록'),
// ),
// ElevatedButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => LoginScreen()),
// );
// },
// child: Text('로그인'),
// ),
// ElevatedButton(
// onPressed: () {
// _auth.signOut();
// // Provider.of<UserData>(context, listen: false)
// //     .signOutUserData();
// },
// child: Text('로그아웃'),
// ),
// ],
// ),
