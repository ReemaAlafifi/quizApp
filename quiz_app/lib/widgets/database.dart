import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
class MyDataBase {
  static Database? db;

  static const tableQuestion = 'questions';
  static const columnId = 'id';
  static const columnQuestion = 'question';
  static const columnOption1 = 'option1';
  static const columnOption2 = 'option2';
  static const columnOption3 = 'option3';
  static const columnOption4 = 'option4';
  static const columnAnswer = 'answer';

  static Future<void> initDataBase() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'quiz_database.db'),
      version: 2,
      onCreate: onCreate,
    );
  }

  static Future<void> onCreate(Database db, int version) async {
    return await db.execute(
      "CREATE TABLE IF NOT EXISTS $tableQuestion($columnId INTEGER PRIMARY KEY, $columnQuestion TEXT NOT NULL, $columnOption1 TEXT NOT NULL, $columnOption2 TEXT NOT NULL, $columnOption3 TEXT NOT NULL, $columnOption4 TEXT NOT NULL, $columnAnswer TEXT NOT NULL)",
    );
  }
}