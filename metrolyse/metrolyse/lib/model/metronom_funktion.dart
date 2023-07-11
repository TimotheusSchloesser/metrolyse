import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

import '../control/slider_bpm.dart';

SliderBpm sliderBpm = const SliderBpm();
GetSliderBpm getSliderBpm = GetSliderBpm();

final player = AudioPlayer();
// var src = null;
int time = 60000 ~/ getSliderBpm.sliderBpmVal();
final timerPer = Timer.periodic(Duration(milliseconds: time), (timer) async {
  const src = 'audio/click.wav';
  await player.play(AssetSource(src));
});

class MetronomFunctions {
  var bpm = getSliderBpm.sliderBpmVal();
  var isRunning = false;

  playClick() {
    // if(!isRunning){
    clickTimer(timerPer);
    // }
    // if (isRunning) {
    // timer.cancel();
  }

  stopClick() {
    clickUntimer(timerPer, player);
  }
  // checkIt.getTwelth()
}

clickTimer(timer) {
  timer;
}

clickUntimer(timerPer, player) {
  if (timerPer.isActive) {
    timerPer.cancel();
    player.stop();
  } else {
    clickTimer(timerPer);
  }
}


  //  void _startTimer() {
  //   // Disable the button after it has been pressed
  //   setState(() {
  //     _isButtonPressed = true;
  //   });
// }
