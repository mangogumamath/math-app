import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/calculation_brain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final calBrain = CalculationBrain(calculationType: CalculationType.mix);

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
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    String text = '(6*(-1)^2)-1/3';
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // calBrain.questionWidget,
          // Text('${MathNodeExpression.fromString(text).calc(MathVariableValues({
          //           'x': 0
          //         })).toFraction()}'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                signInWithGoogle();
              });
            },
            child: Text('버튼'),
          )
        ],
      ),
    );
  }
}
