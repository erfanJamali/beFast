import 'package:flutter/material.dart';

import '../consts/colors.dart';
import '../pages/home_page.dart';

class showResultAnswers_widget extends StatelessWidget {
  final AnimationController _animationController;
  final VoidCallback _popBack;
  final VoidCallback _onTapEvent;
  final int _i;
  final Size _thisSize;

  showResultAnswers_widget(this._animationController, this._popBack,this._onTapEvent, this._i, this._thisSize);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTapEvent,
      borderRadius: (_i % 2 == 0)
          ? const BorderRadius.only(
<<<<<<< HEAD
          topRight: Radius.circular(25), topLeft: Radius.circular(25))
          : const BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)),
=======
              topRight: Radius.circular(25), topLeft: Radius.circular(25))
          : const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
>>>>>>> 0adc3f99db531ccbfa875c7de8620860c2321e04
      child: Container(
        // width: _thisSize.width,
        // height: 50,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(
            color: kColorBlue,
            borderRadius: (_i % 2 == 0)
                ? const BorderRadius.only(
<<<<<<< HEAD
                topRight: Radius.circular(25), topLeft: Radius.circular(25))
                : const BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
=======
                    topRight: Radius.circular(25), topLeft: Radius.circular(25))
                : const BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
>>>>>>> 0adc3f99db531ccbfa875c7de8620860c2321e04
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "QOU '${_i + 1}':\r${(tempAnswerLocation[_i][0] == 0) ? "-- WHITE ANSWER --" : db.atMember(_i).questionAnswers[tempAnswerLocation[_i][1]]}",
              style: TextStyle(
                  color: (db.isTrue(_i)) ? Colors.green : kColorDarkBlue,
                  fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 0adc3f99db531ccbfa875c7de8620860c2321e04
