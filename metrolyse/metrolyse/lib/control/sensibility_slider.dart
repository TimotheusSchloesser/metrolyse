import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../model/metronome_funktion.dart';
import 'controlModels/slider_theme.dart';

double sensValue = 5;
// double sensibilityVal;

class SensSlider extends StatefulWidget {
  const SensSlider({
    super.key,
  });

  @override
  State<SensSlider> createState() => SensSliderState();
}

class SensSliderState extends State<SensSlider> {
  MetronomeFunctionState metronomeFunction = MetronomeFunctionState();
  String valueGetter = sensValue.toInt().toString();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: regWidth * 0.5,
      height: regHight * 2,
      child: SliderModel(
        initSliderValue: sensValue,
        maxValue: 10,
        minValue: 1,
        valueAsText: const Text(
          " Sensibility",
          style: mainRegularTextStyle,
        ),
        valueToChange: (double newValue) {
          setState(() {
            sensValue = newValue;
          });
        },
        enabledThumbRadius: 30,
        trackHeight: 20,
      ),
    );
  }
}
