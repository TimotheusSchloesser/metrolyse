import 'package:flutter/material.dart';
import '../control/motion_input.dart';
import '../control/slider_bpm.dart';

InsteadMotionButtonState getSelected = InsteadMotionButtonState();

class VisualCheck extends StatefulWidget {
  const VisualCheck({super.key});

  @override
  State<VisualCheck> createState() => VisualCheckState();
}

class VisualCheckState extends State<VisualCheck> {
  double _left = 0;
  void start() {
    setState(() {
      _left = bpmInit;
    });
  }

  void end() {
    setState(() {
      _left = bpmInit + 500;
    });
  }

  // double targetValue = 211.0;
  bool selected = getSelected.selectedVal();
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
                left: _left,
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
          },
        ),
        // elevatedButton,
        // elevatedButton2,
      ],
    );
  }
}
