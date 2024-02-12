import 'package:befast/colors.dart';
import 'package:befast/main.dart';
import 'package:befast/questions.dart';
import 'package:flutter/material.dart';

class showResult_page extends StatelessWidget {
  const showResult_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
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
              const SizedBox(height: 40),
              Column(
                children: makeAnswers(context),
              )
            ],
          ),
        ));
  }

  List<Widget> makeAnswers(context) {
    //
    List<Widget> tempList = [];
    //
    for (int i = 0; i < questionsList.length; i++) {
      tempList.add(
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            borderRadius: (i % 2 == 0)
                ? const BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25))
                : const BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                  "QOU '${i + 1}':\r" + "${(tempAnswerLocation[i][0] == 0) ? "-- WHITE ANSWER --" : questionsList[i].questionAnswers[tempAnswerLocation[i][1]]}",
                  style: TextStyle(color: kColorDarkBlue, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return tempList;
  }
}
