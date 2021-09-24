import 'package:flutter/material.dart';

import 'coins_score.dart';
import 'user.dart';

class PlayerDetails extends StatelessWidget {
  const PlayerDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: const <Widget>[
        User(name: 'Jon Doe'),
        CoinsScore(),
      ],
    );
  }
}
