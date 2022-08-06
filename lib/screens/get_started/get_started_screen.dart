import 'package:Quizy/screens/home/home_screen.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/shared_widget.dart';
import '../quiz/quiz_screen.dart';

class GetStartedScreen extends StatelessWidget {
  GetStartedScreen({Key? key, required this.index2, this.listOfCategory})
      : super(key: key);
  int index2;
  List? listOfCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomWidgets().mainColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                    color: CustomWidgets().backgroundColor,
                    borderRadius: BorderRadius.circular(30)),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        listOfCategory![index2].categoryName,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 53, 53, 53),
                            fontWeight: FontWeight.bold,
                            fontSize: 32),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 70, left: 30, right: 30, top: 30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(110, 191, 209, 252),
                              borderRadius: BorderRadius.circular(21)),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10,
                                      ),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: CustomWidgets().mainColor,
                                          ),
                                          height: 35,
                                          width: 35,
                                          child: const Icon(
                                            Icons.question_mark,
                                            color: Colors.white,
                                          )),
                                    ),
                                    Text(
                                      listOfCategory![index].questionNumbers,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  width: 1,
                                  color:
                                      const Color.fromARGB(117, 134, 142, 160),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: CustomWidgets().mainColor,
                                          ),
                                          height: 35,
                                          width: 35,
                                          child: const Icon(
                                            CryptoFontIcons.BTC,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "10 Points",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'dESCRIPTION',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600]),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 20, bottom: 40),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              listOfCategory![index].description!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 60, bottom: 60, left: 30, right: 30),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  primary: CustomWidgets().mainColor),
                              onPressed: () {
                                Get.to(() => QuizScreen(
                                      indexx: index2,
                                    ));
                              },
                              child: const Text("Get Started")),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                height: 100,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.off(() => HomeScreen());
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
