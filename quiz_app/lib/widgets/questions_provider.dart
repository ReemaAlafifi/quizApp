import 'package:quiz_app/models/question.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';

class QuestionsProvider {
  static late final List<Question> questions;

  static Future<void> init() async {
    questions = await getAllQuestion();
  }

  static Future<void> insertQuestion(Question question) async {
    final result = await MyDataBase.db!.insert(
      MyDataBase.tableQuestion,
      question.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    if (result != 0) {
      questions.add(question);
    }
  }

  static Future<void> deleteQuestion(Question question) async {
    final deletedCount = await MyDataBase.db!.delete(
      MyDataBase.tableQuestion,
      where: '${MyDataBase.columnId} = ?',
      whereArgs: [question.id],
    );

    if (deletedCount > 0) {
      questions.remove(question);
    }
  }

  static Future<List<Question>> getAllQuestion() async {
    List<Map> list = await MyDataBase.db!.rawQuery('SELECT * FROM ${MyDataBase.tableQuestion}');

    return list.map((e) => Question.fromMap(e.cast<String, dynamic>())).toList();
  }
}