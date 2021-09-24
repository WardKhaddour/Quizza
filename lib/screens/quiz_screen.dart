import 'dart:async';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/answer.dart';
import '../widgets/player_details.dart';
import '../widgets/progress.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);
  static const routeName = '/quize';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int level = 0;
  int progress = 0;
  Timer? _timer;
  final levelsCount = 10;
  int quistionDuration = 60;
  bool _endTime = false;
  void startTimer() {
    var oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (quistionDuration == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          quistionDuration--;
        });
      }
      if (quistionDuration == 0) {
        setState(() {
          _endTime = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  static int selectionCount = 0;
  void pauseTimer() {
    quistionDuration = 0;
    setState(() {});
  }

  void nextQuestion() {
    selectionCount = 0;
    level++;
    quistionDuration = 60;
    setState(() {});
  }

  bool checkIfFinished() {
    return level < levelsCount;
  }

  bool onSelect(bool isTrue) {
    print('Selected');
    if (!isTrue) {
      pauseTimer();
    } else {
      nextQuestion();
      return checkIfFinished();
    }
    selectionCount++;
    if (selectionCount > 1) {
      return false;
    }
    if (_endTime) return false;

    if (checkIfFinished()) {
      // level++;
      // progress++;
      Future.delayed(Duration(seconds: 2)).then((value) => null);
      return false;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No More '),
          padding: EdgeInsets.all(16),
          backgroundColor: kGreyColor,
        ),
      );
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                PlayerDetails(),
                SizedBox(height: 20),
                Progress(
                  level: level,
                  levelsCount: levelsCount,
                  endTime: _endTime,
                  quistionDuration: quistionDuration,
                ),
                SizedBox(height: 20),
                Text('''Some Question'''),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Answer(
                      answer: 'answer 1',
                      number: 1,
                      isTrue: false,
                      onSelect: onSelect,
                      isFinished: checkIfFinished(),
                    ),
                    Answer(
                      answer: 'answer 2',
                      number: 2,
                      isTrue: true,
                      onSelect: onSelect,
                      isFinished: checkIfFinished(),
                    ),
                    Answer(
                      answer: 'answer 3',
                      number: 3,
                      isTrue: false,
                      onSelect: onSelect,
                      isFinished: checkIfFinished(),
                    ),
                    Answer(
                      answer: 'answer 4',
                      number: 4,
                      isTrue: false,
                      onSelect: onSelect,
                      isFinished: checkIfFinished(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
