import 'package:befast/models/questionsDB.dart';
import 'package:befast/widgets/button_widget.dart';
import 'package:befast/widgets/showResulrAnswers_widget.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../consts/colors.dart';
import 'home_page.dart';

QuestionsDB db = QuestionsDB();

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("your POINT: ${calculatePoint()}",
                  style: const TextStyle(color: kColorDarkBlue, fontSize: 30)),
            ),
          ),
          const SizedBox(height: 20),
          button_widget("PLAY AGAIN", kColorDarkBlue, Colors.white, 20,
              const Radius.circular(20), () {}, 150, 20),
          if (questionIndex + 2 <= db.DBSize) ...{
            const Spacer(),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  "RESUME",
                  textStyle:
<<<<<<< HEAD
                  const TextStyle(color: Colors.black12, fontSize: 100),
=======
                      const TextStyle(color: Colors.black12, fontSize: 100),
>>>>>>> 0adc3f99db531ccbfa875c7de8620860c2321e04
                  colors: [
                    kColorBlue,
                    kColorDarkBlue,
                    Colors.black,
                    kColorBlue,
                    kColorDarkBlue
                  ],
                  speed: const Duration(seconds: 3),
                ),
              ],
            ),
          },
          const Spacer(),
          SizedBox(
            width: thisSize.width,
            height: (questionIndex+2 <= db.DBSize)
                ? thisSize.height * 0.6
                : thisSize.height * 0.75,
            child: ListView.builder(
              itemCount: db.DBSize,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return showResultAnswers_widget(animationController, popBack,
<<<<<<< HEAD
                        () {
                      animationController.reset();
                      doReset = false;
                      questionIndex = index;
                      popBack();
                      animationController.forward();
                    }, index, thisSize);
=======
                    () {
                  animationController.reset();
                  doReset = false;
                  questionIndex = index;
                  popBack();
                  animationController.forward();
                }, index, thisSize);
>>>>>>> 0adc3f99db531ccbfa875c7de8620860c2321e04
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  String calculatePoint() {
    //
    int point = 0;
    //
    for (int i = 0; i < db.DBSize; i++) {
      if (db.isTrue(i)) {
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
<<<<<<< HEAD
}
=======
}
>>>>>>> 0adc3f99db531ccbfa875c7de8620860c2321e04
