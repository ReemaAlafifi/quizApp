import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:quiz_app/widgets/questions_provider.dart';
import '../models/question.dart';
//import '../questions_repository.dart';

class AddNewQuestionScreen extends StatefulWidget {
  const AddNewQuestionScreen({super.key});

  @override
  State<AddNewQuestionScreen> createState() => _AddNewQuestionScreenState();
}

class _AddNewQuestionScreenState extends State<AddNewQuestionScreen> {
  String dropdownValue = 'A';

  final questionTextController = TextEditingController();
  final firstTextController = TextEditingController();
  final secondTextController = TextEditingController();
  final thirdTextController = TextEditingController();
  final fourthTextController = TextEditingController();

  void onCorrectAnswerChanged(String? value) {
    dropdownValue = value!;
    setState(() {});
  }

  Future<void> addNewQuestion() async {
    late String answer;
    switch (dropdownValue) {
      case 'A':
        answer = firstTextController.text.trim();
        break;

      case 'B':
        answer = secondTextController.text.trim();
        break;

      case 'C':
        answer = thirdTextController.text.trim();
        break;

      case 'D':
        answer = fourthTextController.text.trim();
        break;
    }

    await QuestionsProvider.insertQuestion(
      Question(
        question: questionTextController.text.trim(),
        option1: firstTextController.text.trim(),
        option2: secondTextController.text.trim(),
        option3: thirdTextController.text.trim(),
        option4: fourthTextController.text.trim(),
        answer: answer,
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new question'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            children: [
              ///Question field
              TextField(
                controller: questionTextController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Question',
                  prefixIcon: Icon(
                    Icons.question_mark,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              ///Answer A
              _AnswerTextFiled(
                letter: 'A',
                labelText: 'First Answer',
                color: Colors.orange[300]!,
                textController: firstTextController,
              ),
              const SizedBox(
                height: 10,
              ),

              ///Answer B
              _AnswerTextFiled(
                letter: 'B',
                labelText: 'Second Answer',
                color: Colors.green,
                textController: secondTextController,
              ),

              const SizedBox(
                height: 10,
              ),

              ///Answer C
              _AnswerTextFiled(
                letter: 'C',
                labelText: 'Third Answer',
                color: Colors.blueGrey,
                textController: thirdTextController,
              ),

              const SizedBox(
                height: 10,
              ),

              ///Answer D
              _AnswerTextFiled(
                letter: 'D',
                labelText: 'Fourth Answer',
                color: Colors.pink,
                textController: fourthTextController,
              ),
              const SizedBox(
                height: 30,
              ),

              ///select correct answer +  drop down
              Row(
                children: [
                  const Text('Select the correct answer'),
                  Expanded(
                    child: DropdownButton(
                      value: dropdownValue,
                      isExpanded: true,

                      style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 24,
                      ),

                      // Array list of choices
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Center(
                            child: Text(
                              value,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: onCorrectAnswerChanged,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: addNewQuestion,
                  child: const Text(
                    'Add question',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AnswerTextFiled extends StatelessWidget {
  const _AnswerTextFiled({
    required this.letter,
    required this.color,
    required this.textController,
    required this.labelText,
  });

  final String letter;
  final Color color;
  final TextEditingController textController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Text(
            letter,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            controller: textController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              focusColor: Colors.teal,
              labelText: labelText,
            ),
          ),
        ),
      ],
    );
  }
}
