import 'dart:math';

//여기가 주방. 계산은 여기서 처리하기.
class SameAddBrain {
  int x = 0;
  int y = 0;
  int realAnswer = 0;
  int choiceA_value = 0;
  int choiceB_value = 0;
  int choiceC_value = 0;
  int choiceD_value = 0;
  List<int> choiceList = [];
  String choiceA_text = 'A';
  String choiceB_text = 'B';
  String choiceC_text = 'C';
  String choiceD_text = 'D';

  bool checkBool = true;
  int correctCount = 0;

  String questionText = '';

  void resetNumber() {
    choiceList.clear();

    Set choiceSet = {};

    bool randomSignBool = Random().nextBool();

    x = Random().nextInt(10) + 1;
    y = Random().nextInt(10) + 1;

    x = randomSignBool ? x : -x;
    y = randomSignBool ? y : -y;

    questionText = randomSignBool
        ? '(+${x.toString()})+(+${y.toString()}) ='
        : '(${x.toString()})+(${y.toString()}) =';

    choiceSet.add(x + y);

    while (choiceSet.length < 4) {
      choiceSet.add(x + y + Random().nextInt(20) - 10);
    }
    choiceList = [...choiceSet];
    choiceList.shuffle();

    choiceA_value = choiceList[0];
    choiceB_value = choiceList[1];
    choiceC_value = choiceList[2];
    choiceD_value = choiceList[3];

    choiceA_text = choiceA_value > 0
        ? '+${choiceA_value.toString()}'
        : choiceA_value.toString();
    choiceB_text = choiceB_value > 0
        ? '+${choiceB_value.toString()}'
        : choiceB_value.toString();
    choiceC_text = choiceC_value > 0
        ? '+${choiceC_value.toString()}'
        : choiceC_value.toString();
    choiceD_text = choiceD_value > 0
        ? '+${choiceD_value.toString()}'
        : choiceD_value.toString();
  }

  void checkAnswer(int submittedAnswer) {
    realAnswer = x + y;
    checkBool = submittedAnswer == realAnswer ? true : false;
    checkBool ? correctCount++ : {};
    resetNumber();
  }
}
