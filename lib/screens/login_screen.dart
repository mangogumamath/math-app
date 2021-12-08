import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/user_data.dart';
import 'package:calculation_game/widget/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 48.0,
            ),
            TextField(
                style: kTextFieldTextStyle,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                style: kTextFieldTextStyle,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password')),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              color: Colors.blueAccent,
              buttonText: 'Log in',
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
                } catch (e) {
                  print(e);
                }
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
