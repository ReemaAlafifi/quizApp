import 'package:flutter/material.dart';

import 'package:quiz_app/models/question.dart';
//import '../questions_repository.dart';
import 'package:quiz_app/widgets/question_card';
import 'add_new_question_screen.dart';
import 'package:quiz_app/widgets/questions_provider.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({super.key});

  @override
  State<CreateQuizScreen> createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  late List<Question> questions;

  @override
  void initState() {
    super.initState();
    questions = QuestionsProvider.questions;
  }

  Future<void> addNewQuestion() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddNewQuestionScreen(),
      ),
    );

    setState(() {});
  }

  Future <void>  deleteQuestion(Question question, BuildContext context) async {
    await QuestionsProvider.deleteQuestion(question);

    Navigator.of(context).pop();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Question deleted'),
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Quiz'),
      ),
      body: Column(
        children: [
          ///add New Question button
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: addNewQuestion,
              label: const Text(
                'Add new question',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          /// Questions Cards list
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 15,
                ),
                child: QuestionCard(
                  question: questions[i],
                  deleteQuestion:(question, context) => deleteQuestion(question, context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
