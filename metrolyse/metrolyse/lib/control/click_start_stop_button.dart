import 'package:flutter/material.dart';

import '../model/metronome_funktion.dart';
import '../ui_components/constants.dart';
import 'controlModels/icon_button.dart';

class ClickControl extends StatefulWidget {
  const ClickControl({
    super.key,
  });

  @override
  State<ClickControl> createState() => _ClickControlState();
}

class _ClickControlState extends State<ClickControl> {
  MetronomeFunctionState metronomeFunction = MetronomeFunctionState();
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return MyIconButton(
        iconSize: 100,
        splashRadius: 100,
        splashColor: innerButtonColor,
        icon: isPlaying
            ? const Icon(
                Icons.stop_circle_outlined,
              )
            : const Icon(Icons.play_circle_outline_outlined),
        isPressed: () {
          setState(() {
            // Here we changing the icon.
            isPlaying = !isPlaying;
            if (isPlaying) {
              metronomeFunction.startClick();
              // } if(){
            } else {
              metronomeFunction.stopClick();
            }
          });
        });
  }
}
