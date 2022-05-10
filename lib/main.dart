import 'package:flutter/material.dart';
import 'quiz_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Guess the flag',
    home: QuizScreen(),
  ));
}
