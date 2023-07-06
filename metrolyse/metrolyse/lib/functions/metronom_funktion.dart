import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:metrolyse/functions/audio_play.dart';
import 'package:metrolyse/functions/slider_bpm.dart';

AudioPlay audioPlay = AudioPlay();
SliderBpm sliderBpm = const SliderBpm();
GetSliderBpm getSliderBpm = GetSliderBpm();

const src = 'audio/click.wav';

class MetronomFunctions {
  var bpm = getSliderBpm.sliderBpmVal();
  var isRunning = false;

  playClick() {
    // if(!isRunning){
    clickTimer();
    // }
    // if (isRunning) {
    // timer.cancel();
  }
  // checkIt.getTwelth()
}

clickTimer() {
  int time = 1000;
  time = (60000 / getSliderBpm.sliderBpmVal()).toInt();
  Timer.periodic(Duration(milliseconds: time), (timer) async {
    final player = AudioPlayer();
    await player.play(AssetSource(src));
  });
}
// }

stopClick() {
  // Timer.cancel();
  // checkIt.getTwelth()
}
  //  void _startTimer() {
  //   // Disable the button after it has been pressed
  //   setState(() {
  //     _isButtonPressed = true;
  //   });
// }
