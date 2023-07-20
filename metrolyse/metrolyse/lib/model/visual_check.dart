import 'package:flutter/material.dart';

import '../ui_components/constants.dart';

/// Flutter code sample for [AnimatedContainer].

class VisualCheck extends StatefulWidget {
  const VisualCheck({super.key});

  @override
  State<VisualCheck> createState() => VisualCheckState();
}

class VisualCheckState extends State<VisualCheck> {
  double targetValue = 211.0;
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1100,
      height: 100,
      decoration: BoxDecoration(
          color: silderBackgroundColor,
          borderRadius: BorderRadius.circular(50)),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: 100.0,
            height: 100.0,
            left: selected ? 0.0 : 1000.0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 100,
                child: Center(child: Text('Tap me')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
