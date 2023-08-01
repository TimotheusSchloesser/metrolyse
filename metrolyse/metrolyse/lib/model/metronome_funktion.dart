import 'dart:async';
import 'package:flutter/material.dart';

import 'package:metrolyse/model/audio_play.dart';
import 'package:metrolyse/model/visual_check.dart';
import '../constants/constants.dart';
import '../control/click_start_stop_button.dart';
import '../control/slider_bpm.dart';

// Ojects of Imports
AudioPlay audioPlay = AudioPlay();

// bool isPlaying = false;
// The Class MetronomeFunction includes the Button to start/stop
class MetronomeFunction extends StatefulWidget {
  const MetronomeFunction({super.key});
  @override
  State<MetronomeFunction> createState() => MetronomeFunctionState();
}

class MetronomeFunctionState extends State<MetronomeFunction> {
  //Timer class
  Timer? _clickTimer;

//ContextBuilder
  @override
  Widget build(BuildContext context) {
    return Container(
      width: regWidth,
      child: Column(children: [
        ClickControl(pressStart: () {
          setState(
            () {
              isPlaying = !isPlaying;
              if (isPlaying) {
                startClick();
              } else {
                stopClick();
              }
            },
          );
        }),
        SliderBpm(
          bpmInitChange: (double newValue) {
            setState(() {
              bpmInit = newValue;
              if (isPlaying) {
                updateClick();
              }
            });
          },
        ),
      ]),
    );
  }

//Methods
  @override
  void initState() {
    super.initState();
  }

  // Starts the Metronome-Timer
  startClick() async {
    stopClick();
    int duration = 60000 ~/ bpmInit;
    _clickTimer =
        Timer.periodic(Duration(milliseconds: duration), (timer) async {
      await audioPlay.playClick();
      // SystemSound.play(SystemSoundType.click);
      getMetroDates();
      checkAlgo.metroDates();
      print("test");
      // checkAlgo.counterMetro();
    });
  }

  getMetroDates() {
    int clickDate = DateTime.now().millisecondsSinceEpoch;
    return clickDate;
  }

  updateClick() async {
    _clickTimer?.cancel();
    startClick();
  }

  // //Stops the Metronome-Timer
  void stopClick() {
    audioPlay.muteClick();
    _clickTimer?.cancel();
  }
}
