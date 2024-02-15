class Question {
  final String _questionText;
  final List<String> _questionAnswers;
  final int _trueAnswer;
  final String _questionWriter;

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