import 'package:flutter/material.dart';
import 'package:metrolyse/constants/constants.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../control/click_start_stop_button.dart';
import '../control/sensibility_slider.dart';
import 'check_algorythm.dart';

const double sensFactor = 0.003;

CheckAlgo checkAlgo = CheckAlgo();

class VisualCheck extends StatefulWidget {
  const VisualCheck({super.key});

  @override
  State<VisualCheck> createState() => VisualCheckState();
}

class VisualCheckState extends State<VisualCheck> {
  double _posFromLeft = regWidth * 0.5;
  double valueToBeMid = 500;
  double check = 0;
  double oldDate = 0;
  void start(double check) {
    setState(() {
      _posFromLeft = check;
      // print(_posFromLeft);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    accRun();
  }

// Integrades the AccelerometerEvent listener
  void accRun() {
    userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) {
        setState(() {
          double regDate = DateTime.now().millisecondsSinceEpoch.toDouble();
          if (oldDate != regDate) {
            if (event.x >= sensValue * sensFactor ||
                event.y >= sensValue * sensFactor ||
                event.z >= sensValue * sensFactor) {
              checkSum();
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
    );
  }

  checkSum() {
    if (isPlaying && checkAlgo.metroMap.length == lengthValToSum) {
      double? checkAlg = checkAlgo.getDif();
      if (checkAlg != null) {
        check = checkAlg;
        check += valueToBeMid;
        start(check);
      }
      checkAlgo.getInputs();
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: Image.asset(
            'assets/images/icon.png',
            height: 400,
            width: 400,
          ),
        ),
        const Text(
          " ",
          style: mainRegularTextStyle,
        )
      ],
    );
  }
}
