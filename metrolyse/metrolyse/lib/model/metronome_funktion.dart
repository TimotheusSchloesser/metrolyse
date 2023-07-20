import 'dart:async';
import 'package:flutter/material.dart';

import 'package:metrolyse/model/audio_play.dart';
import '../control/click_start_stop_button.dart';
import '../control/slider_bpm.dart';

// Ojects of Imports
GetSliderBpm getSliderBpm = GetSliderBpm();
AudioPlay audioPlay = AudioPlay();

// The Class MetronomeFunction includes the Button to start/stop
class MetronomeFunction extends StatefulWidget {
  const MetronomeFunction({super.key});
  @override
  State<MetronomeFunction> createState() => MetronomeFunctionState();
}

class MetronomeFunctionState extends State<MetronomeFunction> {
  //The value to if Metronome plays on Button change.

  //Timer class
  Timer? clickTimer;

  // The click-BPM initialisation
  final int clickDuration = 60000 ~/ getSliderBpm.sliderBpmVal();
//ContextBuilder
  @override
  Widget build(BuildContext context) {
    return const ClickControl();
  }

//Methods
  @override
  void initState() {
    super.initState();
  }

  // Starts the Metronome-Timer
  startClick() async {
    clickTimer = Timer.periodic(
        Duration(milliseconds: 60000 ~/ getSliderBpm.sliderBpmVal()),
        (timer) => audioPlay.playClick());
    if (mounted) setState(() {});
  }

  //Stops the Metronome-Timer
  void stopClick() {
    audioPlay.muteClick();
    clickTimer!.cancel();
    if (mounted) setState(() {});
  }
}
