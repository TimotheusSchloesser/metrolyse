import 'package:flutter/material.dart';
import 'package:metrolyse/model/audio_play.dart';
import 'package:metrolyse/model/visual_check.dart';
import 'package:reliable_interval_timer/reliable_interval_timer.dart';
import '../constants/constants.dart';
import '../control/click_start_stop_button.dart';
import '../control/slider_bpm.dart';

//Minute Value
const int min = 60000;

// The Class MetronomeFunction includes the Button to start/stop
class MetronomeFunction extends StatefulWidget {
  const MetronomeFunction({super.key});
  @override
  State<MetronomeFunction> createState() => MetronomeFunctionState();
}

class MetronomeFunctionState extends State<MetronomeFunction> {
  //Timer class
  ReliableIntervalTimer? _clickTimer;

//Audio Functions from the Class AudioPlay
  AudioPlay audioPlay = AudioPlay();

//ContextBuilder
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    _clickTimer = ReliableIntervalTimer(
        interval: Duration(milliseconds: min ~/ bpmInit),
        callback: (int elapsedMilliseconds) async {
          await audioPlay.playClick();
          getMetroDates();
          checkAlgo.metroDates();
        });
  }

  // Starts the Metronome-Timer
  startClick() async {
    _clickTimer?.start();
  }

// Sets the click or acceleration Date
  getMetroDates() {
    int clickDate = DateTime.now().millisecondsSinceEpoch;
    return clickDate;
  }

// Updates the Metronome
  updateClick() {
    _clickTimer?.updateInterval(Duration(milliseconds: min ~/ bpmInit));
  }

  // Stops the Metronome-Timer
  void stopClick() async {
    await _clickTimer?.stop();
  }

  @override
  void dispose() {
    _clickTimer?.stop();
    super.dispose();
  }
}
