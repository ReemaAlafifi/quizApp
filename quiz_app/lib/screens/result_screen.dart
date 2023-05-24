import 'package:flutter/material.dart';

import 'package:quiz_app/widgets/constants.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late Map args;
  late int score;
  late int questionsNum;

  late String resultTitle;
  late String resultMessage;
  late String imagePath;

  void goBackToHomeScreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
      (route) => route.isFirst,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    args = ModalRoute.of(context)!.settings.arguments as Map;
    score = args['score'];
    questionsNum = args['questionsNum'];

    double percentage = (score / questionsNum) * 100;

    if (percentage >= 75) {
      resultTitle = "Congratulations!";
      resultMessage = "You're a superstar!";
      imagePath = GOOD_RESULT;
    } else if (percentage >= 50) {
      resultTitle = "Good Job!";
      resultMessage = "Keep up the good work!";
      imagePath = GOOD_RESULT;
    } else {
      resultTitle = "Oops!";
      resultMessage = "Sorry, better luck next time!";
      imagePath = BAD_RESULT;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              resultTitle,
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 34,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              imagePath,
              width: 250,
            ),
            Text(
              'Your Score : $score / $questionsNum',
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
            Text(
              resultMessage,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () => goBackToHomeScreen(context),
                child: const Text(
                  "Back to home",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
