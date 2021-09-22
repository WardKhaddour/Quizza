import 'package:flutter/material.dart';

import './screens/main_screen.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const Quizza());
}

class Quizza extends StatelessWidget {
  const Quizza({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.routeName,
      routes: {
        MainScreen.routeName: (ctx) => MainScreen(),
        QuizScreen.routeName: (ctx) => QuizScreen(),
      },
    );
  }
}
