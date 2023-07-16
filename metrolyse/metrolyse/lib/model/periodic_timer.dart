import 'dart:async';

import '../control/slider_bpm.dart';
import 'audio_play.dart';

Timer? clickTimer;
AudioPlay audioPlay = AudioPlay();
GetSliderBpm getSliderBpm = GetSliderBpm();

class PerTimer {
  final int clickDuration = 60000 ~/ getSliderBpm.sliderBpmVal();

  final clickTimer = Timer.periodic(
      Duration(milliseconds: 60000 ~/ getSliderBpm.sliderBpmVal()), (timer) {
    audioPlay.playClick();
    print("click");
  });

  clickUntimer() {
    audioPlay.muteClick();
    clickTimer.cancel();
  }
}
