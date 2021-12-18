import 'package:calculation_game/model/user_data.dart';
import 'package:calculation_game/screens/main_screen.dart';
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !isLogin,
                      child: Card(
                        color: Colors.white,
                        child: InkWell(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: SizedBox(
                              height: 50.0,
                              width: 250.0,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Image(
                                      height: 40.0,
                                      width: 40.0,
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'images/google_logo_icon.png'),
                                    ),
                                    Text(
                                      '구글 로그인',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black45),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {
                            try {
                              final userCredential = await signInWithGoogle();
                              if (userCredential.user != null) {
                                Provider.of<UserData>(context, listen: false)
                                    .signInUserData(userCredential.user!);
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !isLogin,
                      child: Card(
                        color: Colors.grey,
                        child: InkWell(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: SizedBox(
                              height: 50.0,
                              width: 250.0,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Image(
                                      height: 40.0,
                                      width: 40.0,
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'images/anonymous_user.png'),
                                    ),
                                    Text(
                                      '게스트 로그인',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black45),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {
                            try {
                              final userCredential =
                                  await _auth.signInAnonymously();
                              if (userCredential.user != null) {
                                Provider.of<UserData>(context, listen: false)
                                    .signInUserData(userCredential.user!);
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isLogin,
                      child: const Text(
                        '아무 곳이나 누르세요',
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
