import 'package:calculation_game/constants.dart';
import 'package:calculation_game/model/admob.dart';
import 'package:calculation_game/model/calculation_brain.dart';
import 'package:calculation_game/screens/main_calculation_screens/main_add_screen.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final calBrain = CalculationBrain(calculationType: CalculationType.mix);

  AdMob adMob = AdMob();

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adMob.myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    String text = '(6*(-1)^2)-1/3';
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          adMob.adContainer,
          // calBrain.questionWidget,
          // Text('${MathNodeExpression.fromString(text).calc(MathVariableValues({
          //           'x': 0
          //         })).toFraction()}'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainAddScreen()));
            },
            child: Text('버튼'),
          )
        ],
      ),
    );
  }
}
