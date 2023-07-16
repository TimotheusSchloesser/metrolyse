import 'dart:async';
import 'package:metrolyse/model/audio_play.dart';

import '../control/slider_bpm.dart';
import 'package:flutter/material.dart';
// import '../control/start_stop_button.dart';

GetSliderBpm getSliderBpm = GetSliderBpm();
AudioPlay audioPlay = AudioPlay();

class MetronomeFunction extends StatefulWidget {
  const MetronomeFunction({super.key});

  @override
  State<MetronomeFunction> createState() => _MetronomeFunctionState();
}

class _MetronomeFunctionState extends State<MetronomeFunction> {
  bool isPlaying = false;

  final int clickDuration = 60000 ~/ getSliderBpm.sliderBpmVal();
  Timer? clickTimer;

  @override
  void initState() {
    super.initState();
  }

  startClick() async {
    setState(() => clickTimer = Timer.periodic(
        Duration(milliseconds: 60000 ~/ getSliderBpm.sliderBpmVal()),
        (timer) => audioPlay.playClick()));
  }

  void stopClick() {
    audioPlay.muteClick();
    setState(() => clickTimer!.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return playStopFunc();
  }

  IconButton playStopFunc() {
    return IconButton(
        icon: isPlaying
            ? const Icon(
                Icons.stop_circle_outlined,
              )
            : const Icon(Icons.play_circle_outline_outlined),
        onPressed: () {
          setState(() {
            // Here we changing the icon.
            isPlaying = !isPlaying;
            if (isPlaying) {
              startClick();
            } else {
              stopClick();
            }
          });
        });
  }
}
