import 'dart:async';
import 'package:Quizy/screens/quiz/quiz_bloc.dart';
import 'package:Quizy/screens/quiz/widgets/timer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/shared_widget.dart';
import '../failed/failed_screen.dart';
import '../result/result_screen.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key? key, this.indexx}) : super(key: key);
  int? indexx;
  static const screenRoute = 'quizScreen';

  @override
  State<QuizScreen> createState() => _Quiz2ScreenState();
}

Duration clockTimer = const Duration(seconds: 1);

var bloc = QuizBloc();

class _Quiz2ScreenState extends State<QuizScreen> {
  @override
  void initState() {
    bloc.start = 60;
    bloc.selectedAnswer = "";
    bloc.index2 = 0;
    bloc.answered = false;
    bloc.selectedAnswerIndex = 0;
    bloc.pageController = PageController(initialPage: 0);
    bloc.score = 0;
    startTimer(bloc.score);

    super.initState();
  }

  Widget build(BuildContext context) {
    final CollectionReference questions = FirebaseFirestore.instance
        .collection(bloc.collectionName[widget.indexx!]);
    return Scaffold(
        backgroundColor: CustomWidgets().mainColor,
        body: SafeArea(
          child: StreamBuilder(
              stream: questions.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: bloc.pageController,
                      onPageChanged: (page) {},
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TimerWidget(start: bloc.start),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 5),
                                          child: Center(
                                            child: Text(
                                              "${(streamSnapshot.data!.docs[bloc.index2]["question"])}",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: CustomWidgets()
                                                      .mainColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    "Q. ${(bloc.index2 + 1)}",
                                    style: GoogleFonts.lobster(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          answersList(streamSnapshot),
                          const SizedBox(height: 10),
                          nextQuestionButton(streamSnapshot)
                        ]);
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        )
        // body:
        );
  }

  answersList(streamSnapshot) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
          itemCount: streamSnapshot.data!.docs[bloc.index2]["answers"].length,
          itemBuilder: (context, index) {
            return optionsButton(
                streamSnapshot.data!.docs[bloc.index2]["answers"][index],
                index,
                streamSnapshot);
          }),
    );
  }

  optionsButton(String answer, int index, streamSnapshot) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      height: 35,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            side: const BorderSide(
                width: 2, style: BorderStyle.solid, color: Colors.blueGrey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            primary: bloc.answered
                ? bloc.selectedAnswerIndex == index
                    ? streamSnapshot.data!.docs[bloc.index2]["correctAnswer"] ==
                            answer
                        ? Colors.green
                        : Colors.red
                    : Colors.white
                : Colors.white,
          ),
          onPressed: () {
            if (!bloc.answered) {
              bloc.answered = true;
              bloc.selectedAnswerIndex = index;
              bloc.selectedAnswer = answer;
              bloc.scoreMethod(bloc.index2, streamSnapshot);
              bloc.answerResult = answer ==
                  streamSnapshot.data!.docs[bloc.index2]["correctAnswer"];
              setState(() {});
            }

            bloc.answered = true;
            bloc.selectedAnswerIndex = index;
          },
          child: Text(
            answer,
            style: TextStyle(
                color: CustomWidgets().mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
    );
  }

  nextQuestionButton(streamSnapshot) {
    bool lastQuestion = false;
    if (bloc.index2 == streamSnapshot.data!.docs.length - 1) {
      lastQuestion = true;
    }
    return Container(
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.black, width: 2)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 235, 161, 51),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          onPressed: bloc.answered
              ? () {
                  bloc.selectedAnswer = "";
                  if (lastQuestion) {
                    Get.off(() => ResultScreen(bloc.score, widget.indexx));
                  } else {
                    setState(() {
                      bloc.index2++;
                      bloc.pageController!.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                      bloc.selectedAnswer = "";
                      bloc.answered = false;
                    });
                  }
                }
              : null,
          child: Text(
            lastQuestion ? "See result" : "Next Question",
            style: const TextStyle(color: Colors.black),
          )),
    );
  }

  void startTimer(
    score,
  ) {
    const oneSec = Duration(seconds: 1);

    bloc.timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (bloc.start == 0) {
          setState(() {
            timer.cancel();
            Get.off(() => const FailedScreen());
          });
        } else {
          setState(() {
            bloc.start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    bloc.timer.cancel();

    super.dispose();
  }
}
