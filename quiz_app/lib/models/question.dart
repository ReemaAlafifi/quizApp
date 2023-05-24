import 'package:quiz_app/widgets/database.dart';

class Question {
  int? id;
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String answer;

  Question({
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.answer,
  });

  Map<String, dynamic> toMap() {
    return {
      MyDataBase.columnQuestion: question,
      MyDataBase.columnOption1: option1,
      MyDataBase.columnOption2: option2,
      MyDataBase.columnOption3: option3,
      MyDataBase.columnOption4: option4,
      MyDataBase.columnAnswer: answer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map[MyDataBase.columnQuestion],
      option1: map[MyDataBase.columnOption1],
      option2: map[MyDataBase.columnOption2],
      option3: map[MyDataBase.columnOption3],
      option4: map[MyDataBase.columnOption4],
      answer: map[MyDataBase.columnAnswer],
    )..id = map['id'];
  }
}
