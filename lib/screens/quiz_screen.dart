import 'package:flutter/material.dart';

import '../widgets/answer.dart';
import '../widgets/progress.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);
  static const routeName = '/quize';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int level = 1;
  int progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Progress(level: level, progress: progress),
            Text('''Some Question'''),
            Column(
              children: [
                Answer('answer'),
                TextButton(
                  onPressed: () {
                    if (progress < 100) {
                      level++;
                      progress++;
                      setState(() {});
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('No More ')));
                    }
                  },
                  child: Text('Done!'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
