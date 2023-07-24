import 'package:flutter/material.dart';
import 'package:metrolyse/control/slider_bpm.dart';

import '../model/metronome_funktion.dart';
import '../ui_components/constants.dart';
import 'controlModels/icon_button.dart';

bool isPlaying = false;

class ClickControl extends StatefulWidget {
  const ClickControl({super.key, required this.pressStart});
  final VoidCallback pressStart;
  @override
  State<ClickControl> createState() => ClickControlState();
}

class ClickControlState extends State<ClickControl> {
  MetronomeFunctionState metronomeFunction = MetronomeFunctionState();

  @override
  Widget build(BuildContext context) {
    return MyIconButton(
        iconSize: 100,
        splashRadius: 10,
        splashColor: innerButtonColor,
        icon: isPlaying
            ? const Icon(
                Icons.stop_circle_outlined,
              )
            : const Icon(Icons.play_circle_outline_outlined),
        isPressed: widget.pressStart);
  }
}
