import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  TimerWidget({Key? key, required this.start}) : super(key: key);
  int start;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/clock.png",
          ),
          SizedBox(
              height: 70,
              width: 70,
              child: Center(
                child: Text(
                  "$start",
                  style: TextStyle(
                      color: start <= 10 ? Colors.red : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              )),
        ],
      ),
    );
  }
}
