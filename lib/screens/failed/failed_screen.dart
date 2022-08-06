import 'package:Quizy/screens/home/home_screen.dart';
import 'package:Quizy/screens/quiz/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FailedScreen extends StatelessWidget {
  const FailedScreen({Key? key}) : super(key: key);
  static const screenRoute = 'failed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Failed!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => HomeScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    primary: Colors.white,
                  ),
                  child: const Text(
                    "Back To Home Screen",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
