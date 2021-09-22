import 'package:flutter/material.dart';
import '../constants.dart';

class User extends StatelessWidget {
  const User({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kGreyColor.withOpacity(0.4),
            child: Icon(
              Icons.person_sharp,
              color: kGreyColor.withOpacity(0.7),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
