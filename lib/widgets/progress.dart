import 'package:flutter/material.dart';
import '../constants.dart';

const size = 200.0;
// const TWO_PI = 3.14 * 2;

class Progress extends StatelessWidget {
  const Progress(
      {Key? key,
      required this.level,
      required this.levelsCount,
      required this.endTime,
      required this.quistionDuration})
      : super(key: key);
  final int level;
  // final double progress = level/levelsCount;
  final bool endTime;
  final int quistionDuration;
  final int levelsCount;

  @override
  Widget build(BuildContext context) {
    final progress = level / levelsCount;
    final isFinished = level >= levelsCount;
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(seconds: 0),
      builder: (context, _, child) {
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
                      progress,
                      progress,
                    ],
                    colors: endTime
                        ? [
                            kRedColor,
                            kGreyColor.withOpacity(0.5),
                          ]
                        : [
                            kBlueColor,
                            kGreyColor.withOpacity(0.5),
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
                    color: endTime ? kRedColor : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: isFinished
                      ? Center(
                          child: Text('Finished'),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                endTime ? 'Time Out' : "$quistionDuration",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: endTime ? Colors.white : Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Level $level",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: endTime ? Colors.white : Colors.blue,
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
