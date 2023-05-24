import 'package:flutter/material.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/widgets/questions_provider.dart';
import '../models/question.dart';
//import '../questions_repository.dart';
import '../widgets/answer.dart';
import '../widgets/q.dart';

class StartQuizScreen extends StatefulWidget {
  const StartQuizScreen({super.key});

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  final questions = QuestionsProvider.questions;

  int questionIndex = 0;

  Question get currentQuestion => questions[questionIndex];

  late int numQuestionsToPresent;

  int score = 0;

  @override
  void initState() {
    super.initState();

    //num of question has a maximum of 10
    int numQuestions = questions.length;
    numQuestionsToPresent = numQuestions > 10 ? 10 : numQuestions;

    // randomize the questions order
    questions.shuffle();
  }

  void nextQuestion() {
    setState(() {
      questionIndex++;
    });
  }

  void onAnswerPressed(String answer) {
    if (answer == currentQuestion.answer) {
      score++;
    }

    /// if the user solved all questions then go to result screen
    if (questionIndex + 1 == numQuestionsToPresent) {
      goToResultScreen();
    } else {
      nextQuestion();
    }
  }

  void goToResultScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ResultScreen(),
        settings: RouteSettings(
          arguments: {
            'score': score,
            'questionsNum': numQuestionsToPresent,
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz app'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: numQuestionsToPresent < 5
                ? const LessThan5Questions()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Question number
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Question ${questionIndex + 1} ',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: Colors.teal,
                                ),
                          ),
                          Text(
                            '/ $numQuestionsToPresent',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      ///Question
                      Container(
                        alignment: Alignment.centerLeft,
                        constraints: const BoxConstraints(
                          minHeight: 50,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          currentQuestion.question,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Answer(
                        answer: currentQuestion.option1,
                        onTap: () => onAnswerPressed(currentQuestion.option1),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Answer(
                        answer: currentQuestion.option2,
                        onTap: () => onAnswerPressed(currentQuestion.option2),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Answer(
                        answer: currentQuestion.option3,
                        onTap: () => onAnswerPressed(currentQuestion.option3),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Answer(
                        answer: currentQuestion.option4,
                        onTap: () => onAnswerPressed(currentQuestion.option4),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
