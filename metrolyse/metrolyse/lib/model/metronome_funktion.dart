import 'dart:async';
import '../control/slider_bpm.dart';
import 'package:flutter/material.dart';
// import '../control/start_stop_button.dart';
import 'package:audioplayers/audioplayers.dart';

GetSliderBpm getSliderBpm = GetSliderBpm();

class MetronomeFunction extends StatefulWidget {
  const MetronomeFunction({super.key});

  @override
  State<MetronomeFunction> createState() => _MetronomeFunctionState();
}

class _MetronomeFunctionState extends State<MetronomeFunction> {
  bool isPlaying = false;
  final String src = 'audio/click.wav';

  int clickDuration = 60000 ~/ getSliderBpm.sliderBpmVal();
  final player = AudioPlayer();
  Timer? clickTimer;

  @override
  void initState() {
    super.initState();
  }

  void playClick() {
    setState(() => clickTimer = Timer.periodic(
            Duration(milliseconds: 60000 ~/ getSliderBpm.sliderBpmVal()),
            (timer) async {
          await player.play(AssetSource(src), mode: PlayerMode.lowLatency);
        }));
  }

  void stopClick() {
    player.stop();
    setState(() => clickTimer!.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return playStopFunc();
  }

  IconButton playStopFunc() {
    return IconButton(
        icon: isPlaying
            ? const Icon(Icons.play_circle_outline_outlined)
            : const Icon(
                Icons.stop_circle_outlined,
              ),
        onPressed: () {
          setState(() {
            // Here we changing the icon.
            isPlaying = !isPlaying;
            if (isPlaying) {
              stopClick();
            } else {
              playClick();
            }
          });
        });
  }
}
