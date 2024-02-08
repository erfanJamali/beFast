import 'package:befast/colors.dart';
import 'package:befast/questions.dart';
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
int _clickIndex = 0;
//
bool isClicked = false;
//
List<int> tempAnswerLocation = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
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
          ),
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
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
                                isClicked = false;
                              } else {
                                tempAnswerLocation[index] = index;
                                isClicked = true;
                              }
                            });
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
                                      fontSize: hasClicked(index) ? 50 : 30,
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
              setState(() {
                if (_questionIndex == 9) {
                  _questionIndex = 0;
                } else {
                  _questionIndex++;
                }
              });
            },
            child: Text("scape",
                style: TextStyle(color: kColorDarkBlue, fontSize: 35)),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  List<Widget> makeQuestionAnswers() {
    //
    List<Widget> tempList = [];
    //
    for (int i = 0;
        i < questionsList[_questionIndex].questionAnswers.length;
        i++) {
      tempList.add(
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: kColorDarkBlue,
                width: hasClicked(i) ? 8 : 0,
              )),
          child: Material(
            color: hasClicked(i) ? kColorBlue : kColorDarkBlue,
            borderRadius: hasClicked(i) ? null : BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (hasClicked(i)) {
                    isClicked = false;
                  } else {
                    _clickIndex = i;
                    isClicked = true;
                  }
                });
              },
              borderRadius: hasClicked(i) ? null : BorderRadius.circular(10),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Expanded(
                    child: Text(
                      questionsList[_questionIndex].questionAnswers[i],
                      style: TextStyle(
                          color: hasClicked(i) ? kColorDarkBlue : kColorWhite,
                          fontSize: hasClicked(i) ? 50 : 30,
                          fontWeight: hasClicked(i) ? FontWeight.bold : null),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    //
    return tempList;
    //
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
                  setState(() {
                    _questionIndex = i;
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
    if (isClicked && tempAnswerLocation[_questionIndex]+1 == i) {
      print("yesss");
      return true;
    } else {
      return false;
    }
  }
}

void makeTempAnswerLocationMembers() {
  //
  for (int i = 0; i < questionsList.length; i++) {
    tempAnswerLocation.add(4);
  }
  //
  print(tempAnswerLocation);
}
