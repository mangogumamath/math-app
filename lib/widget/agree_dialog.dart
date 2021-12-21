import 'package:calculation_game/model/agree_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgreeDialog extends StatefulWidget {
  const AgreeDialog({Key? key}) : super(key: key);

  @override
  State<AgreeDialog> createState() => _AgreeDialogState();
}

class _AgreeDialogState extends State<AgreeDialog> {
  bool? _ischecked1 = false;
  bool? _ischecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            const Text(
              '서비스약관에 동의해주세요',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _ischecked1,
                      onChanged: (bool? value) {
                        setState(() {
                          _ischecked1 = value;
                        });
                      },
                    ),
                    InkWell(
                      child: const SizedBox(
                        height: 30.0,
                        child: Center(
                          child: Text(
                            '[필수] 이용약관 동의',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _ischecked1 = !_ischecked1!;
                        });
                      },
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('이용약관'),
                            titleTextStyle: const TextStyle(
                                fontSize: 20.0, fontFamily: 'ONEMobilePOP'),
                            contentTextStyle: const TextStyle(
                                fontSize: 15.0, fontFamily: 'ONEMobilePOP'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  Text(agreeText),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('확인')),
                            ],
                          );
                        });
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: 15.0,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _ischecked2,
                      onChanged: (bool? value) {
                        setState(() {
                          _ischecked2 = value;
                        });
                      },
                    ),
                    InkWell(
                      child: const SizedBox(
                        height: 30.0,
                        child: Center(
                          child: Text(
                            '[필수] 개인정보 수집 및 이용 동의',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _ischecked2 = !_ischecked2!;
                        });
                      },
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('개인정보 수집 및 이용 동의'),
                            titleTextStyle: const TextStyle(
                                fontSize: 20.0, fontFamily: 'ONEMobilePOP'),
                            contentTextStyle: const TextStyle(
                                fontSize: 15.0, fontFamily: 'ONEMobilePOP'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const [
                                  Text(
                                    '[필수] 개인정보 수집 및 이용 동의약관\n'
                                    '수집 항목:\n '
                                    '1. 이메일\n'
                                    '2. 서비스 이용 기록\n'
                                    '수집 목적:\n '
                                    '1. 이용자 식별 및 회원 관리\n'
                                    '2. 컨텐츠 서비스 제공\n'
                                    '보유 기간:\n'
                                    '계정삭제 후 지체없이 파기\n\n'
                                    '동의를 거부할 수 있으나 동의 거부시 서비스 이용이 제한됩니다.',
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('확인')),
                            ],
                          );
                        });
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: 15.0,
                  ),
                )
              ],
            ),
            const Expanded(flex: 2, child: SizedBox()),
            SizedBox(
              height: 50.0,
              width: 300.0,
              child: ElevatedButton(
                child: const Text(
                  '동의하고 시작하기',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                onPressed: (_ischecked1! && _ischecked2!)
                    ? () {
                        Navigator.pop(context, true);
                      }
                    : null,
              ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
