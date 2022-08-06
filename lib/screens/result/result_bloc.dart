class ResultBloc {
  int score2 = 0;
  List<String> collectionName = [
    "quiz2",
    "quiz1",
    "quiz3",
    "quiz3",
  ];
  String calculateThePercentageOfCorrectAnswers(listOfQuestions, score) {
    return (score / listOfQuestions.length * 100).toString();
  }
}
