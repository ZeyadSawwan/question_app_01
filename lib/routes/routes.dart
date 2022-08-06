import 'package:flutter/material.dart';
import '../screens/failed/failed_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/inital/inital.dart';
import '../screens/quiz/quiz_screen.dart';
import '../screens/settings/settings_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => HomeScreen(),
  QuizScreen.screenRoute: (context) => QuizScreen(),
  InitalScreen.screenRoute: (context) => const InitalScreen(),
  SettingsScreen.screenRoute: (context) => SettingsScreen(),
  FailedScreen.screenRoute: (context) => const FailedScreen(),
};
