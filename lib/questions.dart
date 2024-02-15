
var tempAnswerLocation = [];

void makeTempAnswerListZero(){
  tempAnswerLocation = List.generate(questionsList.length, (i) => List.generate(2, (j) => 0));
}

class Question {
  String questionText;
  List<String> questionAnswers;
  String questionWriter;
  int trueAnswer;

  Question(this.questionText, this.questionAnswers, this.trueAnswer,
      this.questionWriter);

}

List<Question> questionsList = [
  Question(
    "What is the capital of France?",
    ["Berlin", "Paris", "Rome", "Tehran"],
    1,
    "Alex",
  ),
  Question(
    "Which planet is known as the Red Planet?",
    ["Venus", "Mars", "Jupiter", "Saturn"],
    1,
    "Emily",
  ),
  Question(
    "Who wrote the play 'Romeo and Juliet'?",
    ["William Shakespeare", "Jane Austen", "Charles Dickens", "Mark Twain"],
    0,
    "Sophia",
  ),
  Question(
    "What is the chemical symbol for water?",
    ["CO2", "O2", "H2O", "NaCl"],
    2,
    "Liam",
  ),
  Question(
    "Which famous scientist developed the theory of relativity?",
    ["Albert Einstein", "Isaac Newton", "Marie Curie", "Galileo Galilei"],
    0,
    "Oliver",
  ),
  Question(
    "What is the tallest mountain in the world?",
    ["K2", "Kilimanjaro", "Makalu", "Mount Everest"],
    3,
    "Emma",
  ),
  Question(
    "Which gas do plants absorb during photosynthesis?",
    ["Carbon dioxide", "Oxygen", "Nitrogen", "Hydrogen"],
    0,
    "Noah",
  ),
  Question(
    "Who painted the 'Mona Lisa'?",
    ["Vincent van Gogh", "Leonardo da Vinci", "Pablo Picasso", "Claude Monet"],
    1,
    "Ava",
  ),
  Question(
    "What is the largest animal on Earth?",
    ["Elephant", "Giraffe", "Blue whale", "Hippopotamus"],
    2,
    "William",
  ),
  Question(
    "Which country is known as the Land of the Rising Sun?",
    ["China", "South Korea", "Vietnam", "Japan"],
    3,
    "Sophia",
  ),
];


