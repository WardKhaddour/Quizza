import 'package:flutter/material.dart';

const size = 200.0;
// const TWO_PI = 3.14 * 2;

class Progress extends StatelessWidget {
  const Progress({Key? key, required this.level, required this.progress})
      : super(key: key);
  final int level;
  final int progress;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(seconds: 0),
      builder: (context, val, child) {
        // final value = double.parse(val!.toString());
        // var percentage = (progress * 100).ceil();
        return Container(
          width: size,
          height: size,
          child: Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return SweepGradient(
                    startAngle: 0.0,
                    stops: [
                      progress.toDouble() / 100,
                      progress.toDouble() / 100
                    ],
                    colors: [
                      Colors.blue,
                      Colors.grey.withOpacity(0.5),
                    ],
                  ).createShader(rect);
                },
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              Center(
                child: Container(
                  width: size - 40,
                  height: size - 40,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$progress",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Level $level",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
