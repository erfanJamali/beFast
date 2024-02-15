import 'package:flutter/material.dart';

import '../consts/colors.dart';
import '../models/questionsDB.dart';

class QuestionNumber_widget extends StatelessWidget {
  final int _i;
  final int questionIndex;
  final QuestionsDB _db;
  final AnimationController _animationController;
  final double _widgetSize;
  final VoidCallback questionNumOnPressed;

  // make widget contractor
  const QuestionNumber_widget(this._i, this.questionIndex, this._db,
      this._animationController, this._widgetSize, this.questionNumOnPressed);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: (_i == 0) ? 20 : 10),
        Material(
          borderRadius: BorderRadius.circular(35),
          color: (questionIndex == _i) ? kColorBlue : kColorDarkBlue,
          child: InkWell(
            onTap: questionNumOnPressed,
            borderRadius: BorderRadius.circular(35),
            child: Container(
              height: _widgetSize,
              width: _widgetSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 3,
                    color: (questionIndex == _i) ? kColorDarkBlue : kColorBlue),
              ),
              //margin: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  (_i + 1).toString(),
                  style: TextStyle(
                      color:
<<<<<<< HEAD
                      (questionIndex == _i) ? kColorDarkBlue : Colors.white,
=======
                          (questionIndex == _i) ? kColorDarkBlue : Colors.white,
>>>>>>> 0adc3f99db531ccbfa875c7de8620860c2321e04
                      fontSize: 30),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: (_i + 1 == _db.DBSize ? 20 : 10),
        ),
      ],
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 0adc3f99db531ccbfa875c7de8620860c2321e04
