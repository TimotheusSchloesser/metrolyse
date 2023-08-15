import 'package:flutter/material.dart';

import '../../constants/constants.dart';

// Slider Model
class SliderModel extends StatefulWidget {
  const SliderModel(
      {super.key,
      required this.valueToChange,
      required this.minValue,
      required this.maxValue,
      required this.initSliderValue,
      required this.valueAsText,
      required this.trackHeight,
      required this.enabledThumbRadius});
  final void Function(double) valueToChange;
  final double minValue;
  final double maxValue;
  final double initSliderValue;
  final Text valueAsText;
  final double trackHeight;
  final double enabledThumbRadius;

  @override
  State<SliderModel> createState() => _SliderModelState();
}

class _SliderModelState extends State<SliderModel> {
// The Slider
  themeSlider() => SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: midColor,
          inactiveTrackColor: midColor,
          trackShape: const RoundedRectSliderTrackShape(),
          trackHeight: widget.trackHeight,
          thumbColor: frontColor,
          thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: widget.enabledThumbRadius),
        ),
        child: Slider(
          value: widget.initSliderValue,
          min: widget.minValue,
          max: widget.maxValue,
          onChanged: widget.valueToChange,
        ),
      );
  Text valueText() {
    return widget.valueAsText;
  }

  //Text for the BPM-Slider
  Text sliderValue() {
    return Text(
      widget.initSliderValue.toInt().toString(),
      style: mainRegularTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: silderBackgroundColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [sliderValue(), valueText()]),
          themeSlider()
        ]));
  }
}
