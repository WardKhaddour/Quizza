import 'package:flutter/material.dart';

class CoinsScore extends StatelessWidget {
  const CoinsScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        SingleCoinScore('520', Icons.money_rounded),
        SingleCoinScore('2358', Icons.attach_money_rounded)
      ],
    );
  }
}

class SingleCoinScore extends StatelessWidget {
  const SingleCoinScore(this.value, this.icon, {Key? key}) : super(key: key);
  final String value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon),
        Text(value),
      ],
    );
  }
}
