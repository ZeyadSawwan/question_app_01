import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  CustomLogo({Key? key, required this.scale}) : super(key: key);
  double scale;
  @override
  Widget build(
    BuildContext context,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        "assets/images/logo.png",
        scale: scale,
      ),
    );
  }
}
