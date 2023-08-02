import 'dart:async';

import 'package:flutter/material.dart';
import 'package:metrolyse/constants/constants.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../control/motion_input.dart';
import '../control/sensibility_slider.dart';
import '../model/metronome_funktion.dart';
import 'check_algorythm.dart';

InsteadMotionButtonState getSelected = InsteadMotionButtonState();
MetronomeFunctionState metronomeFunction = MetronomeFunctionState();
CheckAlgo checkAlgo = CheckAlgo();

class VisualCheck extends StatefulWidget {
  const VisualCheck({super.key});

  @override
  State<VisualCheck> createState() => VisualCheckState();
}

class VisualCheckState extends State<VisualCheck> {
  double _posFromLeft = regWidth * 0.5;
  List<double>? userAccelerometerValues;

  final streamSubscriptions = <StreamSubscription<dynamic>>[];

  void start(double check) {
    setState(() {
      _posFromLeft = check;
    });
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in streamSubscriptions) {
      subscription.cancel();
    }
  }

  double oldDate = 0;

  @override
  void initState() {
    super.initState();
    streamSubscriptions.add(
      userAccelerometerEvents.listen(
        (UserAccelerometerEvent event) {
          setState(() {
            double regDate = DateTime.now().millisecondsSinceEpoch.toDouble();
            if (oldDate != regDate) {
              userAccelerometerValues = <double>[event.x, event.y, event.z];
              if (event.x >= sensValue * 0.005 ||
                  event.y >= sensValue * 0.005 ||
                  event.z >= sensValue * 0.005 && oldDate != regDate) {
                print(" old $oldDate");
                print(sensValue * 0.005);
                if (checkAlgo.inputs.length == 11) {
                  double check = checkAlgo.printInput() + regWidth * 0.5;
                  start(check);
                }
                checkAlgo.getInputs();
              }
            }
            oldDate = regDate;
          });
        },
        onError: (e) {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text("Sensor Not Found"),
                  content: Text(
                      "It seems that your device doesn't support Accelerometer Sensor"),
                );
              });
        },
        cancelOnError: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userAccelerometer = userAccelerometerValues
        ?.map((double v) => v.toStringAsFixed(1))
        .toList();
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: regWidth,
              height: regHight,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      stops: [0.0, 0.5, 1.0],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        backgroundColor,
                        midColor,
                        backgroundColor,
                      ]),
                  borderRadius: BorderRadius.circular(50)),
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    width: regHight,
                    height: regHight,
                    left: _posFromLeft,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    // onEnd: end,
                    child: const Divider(
                      thickness: regHight,
                      height: regHight,
                      indent: 20,
                      endIndent: 40,
                      color: frontColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(350.0),
          child: InsteadMotionButton(
            isTapped: () {
              if (checkAlgo.inputs.length == 11) {
                double check = checkAlgo.printInput() + regWidth * 0.5;
                start(check);
              }
              checkAlgo.getInputs();
            },
          ),
        ),
        Text(
          'Accelerometer: $userAccelerometer',
          style: const TextStyle(fontSize: 50, color: frontColor),
        )
      ],
    );
  }
}
