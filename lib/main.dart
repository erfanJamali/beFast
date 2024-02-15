<<<<<<< HEAD
import 'package:befast/pages/home_page.dart';
=======
import 'package:befast/colors.dart';
import 'package:befast/questions.dart';
import 'package:befast/result_page.dart';
>>>>>>> parent of 65d291b (the project is encapsulated)
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
<<<<<<< HEAD
}
=======
}

<<<<<<< HEAD
>>>>>>> 0adc3f99db531ccbfa875c7de8620860c2321e04
=======
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

class _home_pageState extends State<home_page>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    //

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
    thisSize = MediaQuery.of(context).size;
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Row(
              children: makeQuestionNumber(),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Expanded(
              child: Text(
                questionsList[questionIndex].questionText,
                style: TextStyle(
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
                questionsList[questionIndex].questionAnswers.length,
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
                                  questionsList[questionIndex]
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
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kColorBlue),
            ),
            onPressed: () {
              nextQuestion();
            },
            child: Text("N E X T",
                style: TextStyle(color: kColorDarkBlue, fontSize: 35)),
          ),
          const SizedBox(height: 50),
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
              child: Icon(
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

  List<Widget> makeQuestionNumber() {
    //
    List<Widget> tempList = [];
    //
    for (int i = 0; i < questionsList.length; i++) {
      tempList.add(
        Row(
          children: [
            SizedBox(width: (i == 0) ? 20 : 10),
            Material(
              borderRadius: BorderRadius.circular(35),
              color: (questionIndex == i) ? kColorBlue : kColorDarkBlue,
              child: InkWell(
                onTap: () {
                  animationController.reset();
                  setState(() {
                    //
                    if (questionIndex == questionsList.length) {
                      questionIndex = 0;
                    } else {
                      questionIndex = i;
                    }
                    animationController.forward();
                  });
                },
                borderRadius: BorderRadius.circular(35),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 3,
                        color:
                            (questionIndex == i) ? kColorDarkBlue : kColorBlue),
                  ),
                  //margin: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      (i + 1).toString(),
                      style: TextStyle(
                          color: (questionIndex == i)
                              ? kColorDarkBlue
                              : Colors.white,
                          fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: (i + 1 == questionsList.length) ? 20 : 10),
          ],
        ),
      );
    }
    //
    return tempList;
    //
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
      if (questionIndex + 1 == questionsList.length) {
        animationController.stop();
        pushResultPage();
      } else {
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
        context,
        ModalBottomSheetRoute(
            builder: (context) => const resultPage(),
            isScrollControlled: false));
    if (doReset) {
      makeTempAnswerListZero();
      questionIndex = 0;
    }
  }
}
>>>>>>> parent of 65d291b (the project is encapsulated)
