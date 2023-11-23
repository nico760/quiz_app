import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({super.key,
  required this.question,
  required this.alto
  });

  final String question; 
  final double alto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: alto,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.orange
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Text(question, 
            style: const TextStyle(decoration:TextDecoration.none , fontSize: 20, color: Colors.white, fontFamily: AutofillHints.name ),
            textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}