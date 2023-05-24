import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    super.key,
    required this.onTap,
    required this.answer,
  });

  final void Function() onTap;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        height: 50,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          answer,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
