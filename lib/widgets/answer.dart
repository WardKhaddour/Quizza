import 'package:flutter/material.dart';
import '../constants.dart';

class Answer extends StatefulWidget {
  const Answer(this.answer, {Key? key}) : super(key: key);
  final String answer;

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        color: isSelected ? kBlueColor : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.answer,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
