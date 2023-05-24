// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
///import 'package:flutter_project/questions_repository.dart';
import 'package:quiz_app/screens/add_new_question_screen.dart';
import 'package:quiz_app/screens/create_quiz_screen.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/start_quiz_screen.dart';
import 'widgets/questions_provider.dart';
import 'widgets/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyDataBase.initDataBase();
  await QuestionsProvider.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.teal,
        ),

        //text theme
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20),
          bodyLarge: TextStyle(fontSize: 20),
        ),

        //appBar theme
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.teal,
        ),

        //icon theme
        iconTheme: IconThemeData(
          color: Colors.grey,
          size: 28,
        ),

        // button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(100, 45)),
            backgroundColor: const MaterialStatePropertyAll(Colors.teal),
            textStyle: MaterialStatePropertyAll(
              TextStyle(fontSize: 20),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.teal),
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        //textFiled theme
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.teal,
          prefixIconColor: Colors.teal,
          floatingLabelStyle: TextStyle(
            color: Colors.teal,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
