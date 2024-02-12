import 'package:befast/colors.dart';
import 'package:befast/questions.dart';
import 'package:befast/showResult_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: home_page(),
    ),
  );
}

late Size thisSize;
//
int _questionIndex = 0;
//
//bool isClicked = true;
//
var tempAnswerLocation =
List.generate(questionsList.length, (i) => List.generate(2, (j) => 0));
//
late AnimationController _animationController;
late Animation _animation;

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    //
    _animationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {
          if ((_animation.value * 100).round() >= 98) {
            nextQuestion();
            if (_animationController.isAnimating) {
              _animationController.reset();
              _animationController.forward();
            }
          }
        });
      });
    _animationController.forward();
    //
  }

  @override
  Widget build(BuildContext context) {
    thisSize = MediaQuery
        .of(context)
        .size;
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
                value: _animation.value,
                valueColor: AlwaysStoppedAnimation(kColorBlue),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
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
                questionsList[_questionIndex].questionText,
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
                questionsList[_questionIndex].questionAnswers.length,
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
                                tempAnswerLocation[_questionIndex] = [0, index];
                                // isClicked = false;
                              } else {
                                tempAnswerLocation[_questionIndex] = [1, index];
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
                                  questionsList[_questionIndex]
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
            const SizedBox(width: 20),
            Material(
              borderRadius: BorderRadius.circular(35),
              color: (_questionIndex == i) ? kColorBlue : kColorDarkBlue,
              child: InkWell(
                onTap: () {
                  _animationController.reset();
                  setState(() {
                    //
                    // isClicked = true;
                    //
                    if (_questionIndex == questionsList.length) {
                      _questionIndex = 0;
                    } else {
                      _questionIndex = i;
                    }
                    _animationController.forward();
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
                        color: (_questionIndex == i)
                            ? kColorDarkBlue
                            : kColorBlue),
                  ),
                  //margin: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      (i + 1).toString(),
                      style: TextStyle(
                          color: (_questionIndex == i)
                              ? kColorDarkBlue
                              : Colors.white,
                          fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    //
    return tempList;
    //
  }

  bool hasClicked(int i) {
    if (tempAnswerLocation[_questionIndex][0] == 1 &&
        tempAnswerLocation[_questionIndex][1] == i) {
      return true;
    } else {
      //pushResultPage();
      return false;
    }
  }

  void nextQuestion() {
    _animationController.reset();
    setState(() {
      //
      //isClicked = false;
      //
      if (_questionIndex + 1 == questionsList.length) {
        //pushResultPage();
      } else {
        _questionIndex++;
      }
      //
      _animationController.forward();
    });
  }

  void pushResultPage() {
    //_animationController.clearListeners();
    Navigator.push(
        context,
        ModalBottomSheetRoute(
            builder: (context) => const showResult_page(),
            isScrollControlled: false));
  }
}
