import 'package:calculation_game/model/user_data.dart';
import 'package:calculation_game/screens/main_screen.dart';
import 'package:calculation_game/widget/anonymous_login_button.dart';
import 'package:calculation_game/widget/google_login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class FirstLoginScreen extends StatefulWidget {
  const FirstLoginScreen({Key? key}) : super(key: key);

  @override
  _FirstLoginScreenState createState() => _FirstLoginScreenState();
}

class _FirstLoginScreenState extends State<FirstLoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool isLogin = false;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    isLogin = Provider.of<UserData>(context).isLogin;

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        // splashFactory: NoSplash.splashFactory,
        onTap: () {
          if (isLogin) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainScreen()));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Expanded(flex: 4, child: SizedBox()),
              const Text(
                '무한의 계산',
                style: TextStyle(fontSize: 30.0),
              ),
              const Expanded(flex: 3, child: SizedBox()),
              SizedBox(
                height: 150.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !isLogin,
                      child: GoogleLoginButton(
                        onTap: () async {
                          try {
                            final userCredential = await signInWithGoogle();
                            if (userCredential.additionalUserInfo != null) {
                              await Provider.of<UserData>(context,
                                      listen: false)
                                  .isNewUserRegisterData(userCredential);
                            }
                            if (userCredential.user != null) {
                              await Provider.of<UserData>(context,
                                      listen: false)
                                  .signInUserData(userCredential.user!);
                              isLogin = true;
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                    Visibility(
                      visible: !isLogin,
                      child: AnonymousLoginButton(
                        onTap: () async {
                          try {
                            final userCredential =
                                await _auth.signInAnonymously();
                            if (userCredential.additionalUserInfo != null) {
                              await Provider.of<UserData>(context,
                                      listen: false)
                                  .isNewUserRegisterData(userCredential);
                            }
                            if (userCredential.user != null) {
                              await Provider.of<UserData>(context,
                                      listen: false)
                                  .signInUserData(userCredential.user!);
                              isLogin = true;
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                    Visibility(
                      visible: isLogin,
                      child: const Text(
                        '화면을 터치하세요',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(flex: 2, child: SizedBox()),
              const Text('ver.1.1.2',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                  )),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
