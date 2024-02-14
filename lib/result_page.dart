import 'package:befast/main.dart';
import 'package:befast/questions.dart';
import 'package:befast/questionsDB.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

questionsDB db = questionsDB();

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
                  doReset = true;
                  popBack();
                  // if(questionIndex+1 == questionsList.length) {
                  //   makeTempAnswerListZero();
                  //   questionIndex = 0;
                  // }
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
    for (int i = 0; i < db.DBSize(); i++) {
      tempList.add(
        InkWell(
          onTap: () {
            // Navigator.pop(context);
            // animationController.reset();
            doReset = false;
            questionIndex = i;
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
                  "QOU '${i + 1}':\r${(tempAnswerLocation[i][0] == 0) ? "-- WHITE ANSWER --" : db.atMember(i).questionAnswers[tempAnswerLocation[i][1]]}",
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
    for (int i = 0; i < db.DBSize(); i++) {
      if (isCorrect(i)) {
        point++;
      } else {
        if (tempAnswerLocation[i][0] == 1) {
          point--;
        }
      }
    }
    //
    return point.toString();
  }

  void popBack() {
    Navigator.pop(context);
    scrollController.animateTo(-thisSize.width,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    animationController.forward();
  }

  bool isCorrect(int i) {
    if (tempAnswerLocation[i][0] == 1 &&
        tempAnswerLocation[i][1] == db.atMember(i).trueAnswer) {
      return true;
    } else {
      return false;
    }
  }
}
