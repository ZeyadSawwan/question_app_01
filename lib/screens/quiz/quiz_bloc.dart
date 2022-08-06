import 'dart:async';
import 'package:flutter/material.dart';

class QuizBloc {
  late Timer timer;
  int start = 60;
  bool answerResult = false;
  String selectedAnswer = "";
  int index2 = 0;
  bool answered = false;
  int selectedAnswerIndex = 0;
  PageController? pageController = PageController(initialPage: 0);
  List<String> collectionName = [
    "quiz2",
    "quiz1",
    "quiz3",
    "quiz3",
  ];

  int score = 0;

  void scoreMethod(index, streamSnapshot) {
    if (selectedAnswer == streamSnapshot.data!.docs[index]["correctAnswer"]) {
      score += 1;
    }
  }
}
