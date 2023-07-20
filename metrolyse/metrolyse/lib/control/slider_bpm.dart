import 'package:flutter/material.dart';
import '../ui_components/constants.dart';

double bpmInit = 150.0;

class SliderBpm extends StatefulWidget {
  const SliderBpm({super.key});

  @override
  State<SliderBpm> createState() => _SliderBpmState();
}

class _SliderBpmState extends State<SliderBpm> {
  String bpmGetter = bpmInit.toInt().toString();

// The BPM-Slider
  Slider bpmSlider() => Slider(
      value: bpmInit,
      min: 50,
      max: 250,
      onChanged: (double newValue) {
        setState(() {
          bpmInit = newValue;
        });
      });

//Just the text for the BPM-Slider
  Text bpmText() {
    return const Text(
      'BPM',
      style: mainRegularTextStyle,
      textScaleFactor: 0.5,
    );
  }

  //Just the text for the BPM-Slider
  Text bpmValue() {
    return Text(
      bpmInit.toInt().toString(),
      style: mainRegularTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: silderBackgroundColor,
            borderRadius: BorderRadius.circular(50)),
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [bpmValue(), const SizedBox(width: 10), bpmText()]),
          bpmSlider()
        ]));
  }
}

class GetSliderBpm with ChangeNotifier {
  sliderBpmVal() {
    var bpm = bpmInit;
    return bpm;
  }
}
