import 'package:flutter/material.dart';

import 'package:quiz_app/widgets/constants.dart';

class LessThan5Questions extends StatelessWidget {
  const LessThan5Questions({super.key});

  void goBackToHomeScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Sorry!',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 34,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'You must add at least 5 questions to start',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          FAQ,
          width: 200,
        ),
        const SizedBox(
          height: 30,
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
    );
  }
}
