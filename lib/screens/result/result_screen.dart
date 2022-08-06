import 'package:Quizy/screens/result/result_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../shared/custom_logo.dart';
import '../../shared/shared_widget.dart';
import '../home/home_screen.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(this.score, this.indexx, {Key? key}) : super(key: key);
  int score;
  int? indexx;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

var bloc = ResultBloc();

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference questions = FirebaseFirestore.instance
        .collection(bloc.collectionName[widget.indexx!]);
    return StreamBuilder(
        stream: questions.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return Scaffold(
              backgroundColor: CustomWidgets().mainColor,
              body: SafeArea(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(60),
                              child: CustomLogo(scale: 0.1)),
                          CircularPercentIndicator(
                            radius: 42,
                            lineWidth: 8,
                            percent:
                                widget.score / streamSnapshot.data!.docs.length,
                            center: Text(
                              "${bloc.calculateThePercentageOfCorrectAnswers(streamSnapshot.data!.docs, widget.score)} %",
                              style: GoogleFonts.neuton(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black87),
                            ),
                            progressColor: CustomWidgets().mainColor,
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Container(
                            width: 60,
                            color: CustomWidgets().mainColor,
                            child: Column(
                              children: [
                                Text(
                                  "${widget.score}/${streamSnapshot.data!.docs.length}",
                                  style: GoogleFonts.oldStandardTt(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  side: BorderSide(
                                      width: 3,
                                      color: CustomWidgets().mainColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  primary: Colors.transparent),
                              onPressed: () {
                                Get.offAll(() => HomeScreen());
                              },
                              child: Text(
                                "Back To Home Page",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
