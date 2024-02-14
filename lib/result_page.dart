import 'package:befast/main.dart';
import 'package:befast/questions.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class resultPage extends StatefulWidget {
  const resultPage({super.key});

  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () {
                  popBack();
                  if(questionIndex+1 == questionsList.length) {
                    makeTempAnswerListZero();
                    questionIndex = 0;
                  }
                },
                borderRadius: BorderRadius.circular(2.5),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 5,
                  decoration: BoxDecoration(
                    color: kColorDarkBlue,
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("your POINT:" + " " + calculatePoint(),
                  style: TextStyle(color: kColorDarkBlue, fontSize: 30)),
            ),
            const SizedBox(height: 30),
            Column(
              children: makeAnswers(context),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> makeAnswers(context) {
    //
    List<Widget> tempList = [];
    //
    for (int i = 0; i < questionsList.length; i++) {
      tempList.add(
        InkWell(
          onTap: () {
            questionIndex = i;
            // Navigator.pop(context);
            // animationController.reset();
            popBack();
          },
          borderRadius: (i % 2 == 0)
              ? const BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25))
              : const BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: kColorBlue,
                borderRadius: (i % 2 == 0)
                    ? const BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))
                    : const BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25))),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "QOU '${i + 1}':\r${(tempAnswerLocation[i][0] == 0) ? "-- WHITE ANSWER --" : questionsList[i].questionAnswers[tempAnswerLocation[i][1]]}",
                  style: TextStyle(
                      color: (isCorrect(i)) ? Colors.green : kColorDarkBlue,
                      fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      );
    }
    //
    return tempList;
  }

  String calculatePoint() {
    //
    int point = 0;
    //
    for (int i = 0; i < questionsList.length; i++) {
      if (isCorrect(i)) {
        point++;
      } else {
        if(tempAnswerLocation[i][0] == 1) {
          point--;
        }
      }
    }
    //
    return point.toString();
  }

  void popBack() {
    Navigator.pop(context);
    animationController.forward();
  }

  bool isCorrect(int i) {
    if (tempAnswerLocation[i][0] == 1 &&
        tempAnswerLocation[i][1] == questionsList[i].trueAnswer) {
      return true;
    } else {
      return false;
    }
  }
}
