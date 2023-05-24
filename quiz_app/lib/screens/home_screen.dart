import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/constants.dart';
import 'package:quiz_app/screens/start_quiz_screen.dart';
import 'package:quiz_app/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz app'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              QUIZ,
              width: 400,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const StartQuizScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Let's Start!",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
