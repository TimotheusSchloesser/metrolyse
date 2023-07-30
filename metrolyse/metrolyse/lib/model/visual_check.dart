import 'package:flutter/material.dart';
import 'package:metrolyse/control/click_start_stop_button.dart';
import '../control/motion_input.dart';
import '../control/slider_bpm.dart';
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
  double _posFromLeft = 0;

  void start(double check) {
    setState(() {
      print("check $check");
      _posFromLeft = check;
    });
  }

  // void end() {
  //   setState(() {
  //     _posFromLeft = check;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1100,
          height: 100,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  stops: [0.0, 0.5, 1.0],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 99, 99, 100),
                    Color.fromARGB(53, 0, 94, 171),
                    Color.fromARGB(255, 99, 99, 100),
                  ]),
              borderRadius: BorderRadius.circular(50)),
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                width: 100.0,
                height: 100.0,
                left: _posFromLeft,
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                // onEnd: end,
                child: const Divider(
                  thickness: 100,
                  // height: 50,
                  indent: 40,
                  endIndent: 40,
                  color: Color.fromARGB(100, 33, 149, 243),
                  // child: Center(child: Text('0')),
                ),
              ),
            ],
          ),
        ),
        InsteadMotionButton(
          isTapped: () {
            if (checkAlgo.inputs.length == 11) {
              double check = checkAlgo.printInput() + 550;
              start(check);
              print(check - 550);
            }
            checkAlgo.getInputs();
          },
        ),
      ],
    );
  }

  // sumMetroMap() {
  //   Iterable values = inputs.values;
  //   num result = values.reduce((sum, value) => sum + value);
  //   result = result / inputs.length - 1;
  //   print(result);
  //   return result;
  // }
}
