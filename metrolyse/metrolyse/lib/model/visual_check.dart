import 'package:flutter/material.dart';
import 'package:metrolyse/control/click_start_stop_button.dart';
import '../control/motion_input.dart';
import '../control/slider_bpm.dart';
import '../model/metronome_funktion.dart';

InsteadMotionButtonState getSelected = InsteadMotionButtonState();
MetronomeFunctionState metronomeFunction = MetronomeFunctionState();

class VisualCheck extends StatefulWidget {
  const VisualCheck({super.key});

  @override
  State<VisualCheck> createState() => VisualCheckState();
}

class VisualCheckState extends State<VisualCheck> {
  double _posFromLeft = 0;
  Map inputs = {
    "id": 0,
  };
  void start() {
    setState(() {
      _posFromLeft = bpmInit;
    });
  }

  void end() {
    setState(() {
      _posFromLeft = bpmInit + 500;
    });
  }

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
                onEnd: end,
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
            start();
            // getInputs();
            printInput();
          },
        ),
      ],
    );
  }

  getInputs() {
    // List list = [inputs["id"], inputs["date"]];
    int id = inputs["id"];
    inputs["id"]++;

    // int date = 10;
    int date = DateTime.now().millisecondsSinceEpoch;
    int oldate = inputs.values.elementAt(id - 1);
    if (isPlaying && id <= 11) {
      inputs[id] = date;
      if (inputs[id] > 2) {
        inputs.update(id, (value) => date + oldate);

        print(date);
      }
      return inputs;
    } else {
      inputs.clear();
      inputs["id"] = 0;
      inputs[0] = date;
      inputs["id"]++;
      return inputs;
    }
  }

  // sumInputs(date) {
  //   date += date;
  //   print(date);
  //   return date;
  // }

  printInput() {
    print(getInputs());
    // return getInputs();
  }
}
