import 'package:befast/questionsDB.dart';

questionsDB db = questionsDB();

var tempAnswerLocation = [];

void makeTempAnswerListZero() {
  tempAnswerLocation =
      List.generate(db.DBSize(), (i) => List.generate(2, (j) => 0));
}

class Question {
  String _questionText;
  List<String> _questionAnswers;
  int _trueAnswer;
  String _questionWriter;

  Question(this._questionText, this._questionAnswers, this._trueAnswer,
      this._questionWriter);

  String get questionText {
    return _questionText;
  }

  List<String> get questionAnswers {
    return _questionAnswers;
  }

  int get trueAnswer {
    return _trueAnswer;
  }

  String get questionWriter {
    return _questionWriter;
  }
}
