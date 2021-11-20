import 'package:calculation_game/constants.dart';
import 'package:calculation_game/screens/intro_slider.dart';
import 'package:calculation_game/widget/circledsign.dart';

import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  late TabController tabController;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.addListener(() {
      setState(() {});
    });

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TabPageSelector(
          controller: tabController,
        ),
      ),
    );
    // body: Column(
    //   children: [
    //     Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 '(',
    //                 style: TextStyle(
    //                   fontSize: 40.0,
    //                 ),
    //               ),
    //               CircledSign(
    //                 text: '+',
    //                 color: Colors.redAccent.withOpacity(0.0),
    //               ),
    //               Text(
    //                 '2)+(',
    //                 style: TextStyle(
    //                   fontSize: 40.0,
    //                 ),
    //               ),
    //               CircledSign(
    //                 text: '+',
    //                 color: Colors.redAccent.withOpacity(0.0),
    //               ),
    //               Text(
    //                 '3)=(',
    //                 style: TextStyle(
    //                   fontSize: 40.0,
    //                 ),
    //               ),
    //               CircledSign(
    //                 text: '+',
    //                 color: Colors.redAccent.withOpacity(0.0),
    //               ),
    //               Text(
    //                 '5)',
    //                 style: TextStyle(
    //                   fontSize: 40.0,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //     Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 '(',
    //                 style: TextStyle(
    //                   fontSize: 40.0,
    //                 ),
    //               ),
    //               CircledSign(
    //                 text: '+',
    //                 color: Colors.redAccent
    //                     .withOpacity(animationController.value),
    //               ),
    //               Text(
    //                 '2)+(',
    //                 style: TextStyle(
    //                   fontSize: 40.0,
    //                 ),
    //               ),
    //               CircledSign(
    //                 text: '+',
    //                 color: Colors.redAccent
    //                     .withOpacity(animationController.value),
    //               ),
    //               Text(
    //                 '3)=(',
    //                 style: TextStyle(
    //                   fontSize: 40.0,
    //                 ),
    //               ),
    //               CircledSign(
    //                 text: '+',
    //                 color: Colors.redAccent
    //                     .withOpacity(animationController.value),
    //               ),
    //               Text(
    //                 '5)',
    //                 style: TextStyle(
    //                   fontSize: 40.0,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           // Row(
    //           //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           //   children: [
    //           //     Container(
    //           //       margin: EdgeInsets.all(10.0),
    //           //       child: ElevatedButton(
    //           //         style: calculationButtonStyle,
    //           //         child: Text(
    //           //           '이전',
    //           //           style: TextStyle(fontSize: 50),
    //           //         ),
    //           //         onPressed: () {
    //           //           setState(() {
    //           //             animationController.reverse(from: 1.0);
    //           //           });
    //           //         },
    //           //       ),
    //           //     ),
    //           //     Container(
    //           //       margin: EdgeInsets.all(10.0),
    //           //       child: ElevatedButton(
    //           //         style: calculationButtonStyle,
    //           //         child: Text(
    //           //           '다음',
    //           //           style: TextStyle(fontSize: 50),
    //           //         ),
    //           //         onPressed: () {
    //           //           setState(() {
    //           //             animationController.forward();
    //           //           });
    //           //         },
    //           //       ),
    //           //     ),
    //           //   ],
    //           // ),
    //         ],
    //       ),
    //     ),
    //   ],
    // ));
  }
}
