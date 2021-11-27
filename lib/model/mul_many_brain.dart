import 'dart:math';

//여기가 주방. 계산은 여기서 처리하기.
class MulManyBrain {
  int x = 0;
  int y = 0;
  int z = 0;
  int w = 0;

  String str_x = '';
  String str_y = '';
  String str_z = '';
  String str_w = '';
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

    x = Random().nextBool()
        ? Random().nextInt(7) + 1
        : (Random().nextInt(7) + 1) * -1;
    y = Random().nextBool()
        ? Random().nextInt(7) + 1
        : (Random().nextInt(7) + 1) * -1;
    z = Random().nextBool()
        ? Random().nextInt(7) + 1
        : (Random().nextInt(7) + 1) * -1;
    w = Random().nextBool()
        ? Random().nextInt(7) + 1
        : (Random().nextInt(7) + 1) * -1;

    str_x = x > 0 ? '(+${x.toString()})' : '(${x.toString()})';
    str_y = y > 0 ? '(+${y.toString()})' : '(${y.toString()})';
    str_x = str_x == '(0)' ? '0' : str_x;
    str_y = str_y == '(0)' ? '0' : str_y;
    str_z = z > 0 ? '(+${z.toString()})' : '(${z.toString()})';
    str_w = w > 0 ? '(+${w.toString()})' : '(${w.toString()})';
    str_z = str_z == '(0)' ? '0' : str_z;
    str_w = str_w == '(0)' ? '0' : str_w;

    realAnswer = randomSignBool ? x * y * z * w : x * y * z;
    questionText = randomSignBool
        ? str_x + '×' + str_y + '\n' + '×' + str_z + '×' + str_w + '='
        : str_x + '×' + str_y + '\n' + '×' + str_z + '=';

    choiceSet.add(realAnswer);

    while (choiceSet.length < 4) {
      choiceSet.add(Random().nextBool()
          ? (realAnswer + Random().nextInt(20) - 10)
          : ((realAnswer + Random().nextInt(20) - 10) * -1));
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
    checkBool = submittedAnswer == realAnswer ? true : false;
    checkBool ? correctCount++ : {};
    resetNumber();
  }
}
