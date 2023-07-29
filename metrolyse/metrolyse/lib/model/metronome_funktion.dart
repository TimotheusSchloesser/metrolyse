import 'dart:async';
import 'package:flutter/material.dart';

import 'package:metrolyse/model/audio_play.dart';
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
  Map metroMap = {"id": 0};

//ContextBuilder
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1100,
      child: Column(children: [
        ClickControl(pressStart: () {
          setState(
            () {
              // Here we changing the icon.
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
    _clickTimer = Timer.periodic(Duration(milliseconds: duration), (timer) {
      audioPlay.playClick();
      getClickDate();
      printInput();
    });
  }

  updateClick() async {
    _clickTimer?.cancel();
    startClick();
  }

  //Stops the Metronome-Timer
  void stopClick() {
    audioPlay.muteClick();
    _clickTimer?.cancel();
  }

  getClickDate() {
    int clickDate = DateTime.now().millisecondsSinceEpoch;
    return clickDate;
  }

  getmetroDates() {
    int id = metroMap["id"];

    int metronomeDate = getClickDate();
    if (isPlaying && id < 12) {
      metroMap[id] = metronomeDate;

      // if (inputs[id] > 2) {
      //   inputs.update(id, (value) => date + oldate);

      //   print(date);
      // }
      // return metroMap.values.elementAt(id);
    } else {
      metroMap.clear();
      metroMap["id"] = 0;
      metroMap[0] = metronomeDate;
      // metroMap["id"]++;
      // return metroMap.values.elementAt(id);
    }
    if (id < 11) {
      metroMap["id"]++;
    }
    int metro = metroMap.values.elementAt(id);
    return metro;
  }

  printInput() {
    // print("metro: ");
    print(getmetroDates());
  }
}
