import 'package:befast/pages/result_page.dart';
import 'package:befast/widgets/button_widget.dart';
import 'package:befast/widgets/questionNumber_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../consts/colors.dart';
import '../models/questions.dart';
import '../models/questionsDB.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int questionIndex = 0;
//
late Size thisSize;
//
late AnimationController animationController;
late Animation animation;
//
bool doReset = false;
//
ScrollController scrollController = ScrollController();
//
QuestionsDB db = QuestionsDB();
//
String _currentBtnText = "N E X T";
//
var tempAnswerLocation = [];

void makeTempAnswerListZero() {
  tempAnswerLocation =
      List.generate(db.DBSize, (i) => List.generate(2, (j) => 0));
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    //
    //_currentBtnText =  "N E X T";

    //
    makeTempAnswerListZero();
    //
    animationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {
          if ((animation.value * 100).round() >= 98) {
            nextQuestion();
            if (animationController.isAnimating) {
              animationController.reset();
              animationController.forward();
            }
          }
        });
      });
    animationController.forward();
    //
  }

  @override
  Widget build(BuildContext context) {
    //
    thisSize = MediaQuery.of(context).size;
    //
    //
    return Scaffold(
      backgroundColor: kColorWhite,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                width: 5,
                color: kColorDarkBlue,
              ),
              color: kColorWhite,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: LinearProgressIndicator(
                value: animation.value,
                valueColor: AlwaysStoppedAnimation(Colors.red.shade500),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 70,
            child: ListView.builder(
              controller: scrollController,
              itemCount: db.DBSize,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return QuestionNumber_widget(
                    index, questionIndex, db, animationController, 70, () {
                  animationController.reset();
                  setState(() {
                    if (questionIndex == db.DBSize) {
                      questionIndex = 0;
                    } else {
                      questionIndex = index;
                    }
                    animationController.forward();
                  });
                });
              },
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Expanded(
              child: Text(
                db.atMember(questionIndex).questionText,
                style: const TextStyle(
                    color: kColorDarkBlue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: (thisSize.height * 0.5),
            width: thisSize.width - 40,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              children: List.generate(
                db.atMember(questionIndex).questionAnswers.length,
                    (index) {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: kColorDarkBlue,
                            width: hasClicked(index) ? 8 : 0,
                          )),
                      child: Material(
                        color: hasClicked(index) ? kColorBlue : kColorDarkBlue,
                        borderRadius: hasClicked(index)
                            ? null
                            : BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (hasClicked(index)) {
                                tempAnswerLocation[questionIndex] = [0, index];
                                // isClicked = false;
                              } else {
                                tempAnswerLocation[questionIndex] = [1, index];
                                // isClicked = true;
                              }
                            });
                            //nextQuestion();
                          },
                          borderRadius: hasClicked(index)
                              ? null
                              : BorderRadius.circular(10),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Expanded(
                                child: Text(
                                  db
                                      .atMember(questionIndex)
                                      .questionAnswers[index],
                                  style: TextStyle(
                                      color: hasClicked(index)
                                          ? kColorDarkBlue
                                          : kColorWhite,
                                      fontSize: hasClicked(index) ? 45 : 30,
                                      fontWeight: hasClicked(index)
                                          ? FontWeight.bold
                                          : null),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          button_widget(_currentBtnText, kColorDarkBlue, Colors.white, 35, const Radius.circular(20),
              nextQuestion, 10, 5),
          const SizedBox(height: 20),
        ],
      ),
      floatingActionButton: Material(
        color: kColorWhite,
        child: Material(
          color: kColorDarkBlue,
          borderRadius: BorderRadius.circular(50),
          child: InkWell(
            onTap: () {
              pushResultPage();
            },
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: const Icon(
                Icons.library_add_check_rounded,
                size: 30,
                color: kColorWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool hasClicked(int i) {
    if (tempAnswerLocation[questionIndex][0] == 1 &&
        tempAnswerLocation[questionIndex][1] == i) {
      return true;
    } else {
      //pushResultPage();
      return false;
    }
  }

  void nextQuestion() {
    setState(() {
      //
      if (questionIndex + 1 == db.DBSize) {
        animationController.stop();
        pushResultPage();
      } else {
        if(questionIndex - 5 == db.DBSize){
          _currentBtnText = "SEE RESULT";
        }
        scrollController.animateTo(questionIndex * 90.0,
            duration: const Duration(seconds: 2), curve: Curves.ease);
        animationController.reset();
        questionIndex++;
        animationController.forward();
      }
      //
    });
  }

  void pushResultPage() async {
    animationController.stop();
    final result = await Navigator.push(
        context, CupertinoPageRoute(builder: (context) => const ResultPage()));
    if (doReset) {
      makeTempAnswerListZero();
      questionIndex = 0;
    }
  }
}