import 'package:flutter/material.dart';
import '../constants.dart';

class Answer extends StatefulWidget {
  const Answer({
    required this.answer,
    required this.number,
    required this.isTrue,
    required this.onSelect,
    required this.isFinished,
  });
  final String answer;
  final int number;
  final bool isTrue;
  final bool isFinished;
  final bool Function(bool) onSelect;
  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !widget.isFinished
          ? null
          : () {
              setState(() {
                // isSelected = !isSelected;
                isSelected = widget.onSelect.call(widget.isTrue);
              });
            },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        color: isSelected
            ? widget.isTrue
                ? kGreenColor
                : kRedColor
            : Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor:
                isSelected ? Colors.white : kGreyColor.withOpacity(0.5),
            child: Text(widget.number.toString(),
                style: TextStyle(fontSize: 16, color: kGreyColor)),
          ),
          title: Text(
            widget.answer,
            style: TextStyle(
                fontSize: 16, color: isSelected ? Colors.white : kGreyColor),
          ),
        ),
      ),
    );
  }
}
