import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../model/metronome_funktion.dart';

double bpmInit = 150.0;

class SliderBpm extends StatefulWidget {
  const SliderBpm({super.key, required this.bpmInitChange});
  final void Function(double) bpmInitChange;

  @override
  State<SliderBpm> createState() => _SliderBpmState();
}

class _SliderBpmState extends State<SliderBpm> {
  MetronomeFunctionState metronomeFunction = MetronomeFunctionState();
  String bpmGetter = bpmInit.toInt().toString();

// The BPM-Slider
  bpmSlider() => SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: midColor,
        inactiveTrackColor: midColor,
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 30.0,
        thumbColor: frontColor,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 50.0),
      ),
      child: SizedBox(
          width: 1000,
          child: Slider(
            value: bpmInit,
            min: 50,
            max: 250,
            onChanged: widget.bpmInitChange,
          )));
  Text bpmText() {
    return const Text(
      '  BPM',
      style: bpmTextValueStyle,
      textScaleFactor: 0.5,
    );
  }

  //Just the text for the BPM-Slider
  Text bpmValue() {
    return Text(
      bpmInit.toInt().toString(), style: bpmTextValueStyle,
      // textScaleFactor: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: silderBackgroundColor,
            borderRadius: BorderRadius.circular(50)),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            bpmValue(),
            const SizedBox(
              width: 5,
              height: 200,
            ),
            bpmText()
          ]),
          bpmSlider()
        ]));
  }
}
