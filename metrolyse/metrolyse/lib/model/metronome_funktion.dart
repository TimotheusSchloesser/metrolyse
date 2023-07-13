import 'dart:async';
import '../control/slider_bpm.dart';
import 'package:flutter/material.dart';
// import '../control/start_stop_button.dart';
import 'package:audioplayers/audioplayers.dart';

GetSliderBpm getSliderBpm = GetSliderBpm();
// GetClickP getClickP = GetClickP();
bool isPlaying = false;

int clickDuration = 60000 ~/ getSliderBpm.sliderBpmVal();
final player = AudioPlayer();

class MetronomeFunction extends StatefulWidget {
  const MetronomeFunction({super.key});

  @override
  State<MetronomeFunction> createState() => _MetronomeFunctionState();
}

class _MetronomeFunctionState extends State<MetronomeFunction> {
  Timer? clickTimer;

  @override
  void initState() {
    super.initState();
  }

  void playClick() {
    clickTimer = Timer.periodic(
        Duration(milliseconds: clickDuration), (_) => setClickCount());
  }

  void stopClick() {
    player.stop();
    setState(() => clickTimer!.cancel());
  }

  void setClickCount() {
    setState(() async {
      const src = 'audio/click.wav';
      await player.play(AssetSource(src));
    });
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
              playClick();
            } else {
              stopClick();
            }
          });
        });
  }
}








// import 'dart:async';
// import 'package:audioplayers/audioplayers.dart';
// import '../control/slider_bpm.dart';
// import '../control/start_stop_button.dart';

// SliderBpm sliderBpm = const SliderBpm();
// GetSliderBpm getSliderBpm = GetSliderBpm();
// GetClickP getClickP = GetClickP();

// int time = 60000 ~/ getSliderBpm.sliderBpmVal();
// final player = AudioPlayer();
// var bpm = getSliderBpm.sliderBpmVal();
// var counter = 3;
// Timer? timerClass;

// class MetronomeFunction {
//   Timer timerClass = Timer.periodic(Duration(milliseconds: time), (timer) {
//     print(timer.tick);
//     counter++;
//     // getClickP.clickplays();
//     if (getClickP.clickplays() == false) {
//       print('Cancel timer');
//       timer.cancel();
//     }
//   });
//   playClick() {
//     timerClass;
//   }
// }










// final player = AudioPlayer();
// // var src = null;
// int time = 60000 ~/ getSliderBpm.sliderBpmVal();
// final timerPer = Timer.periodic(Duration(milliseconds: time), (timer) async {
//   const src = 'audio/click.wav';
//   await player.play(AssetSource(src));
// });

// class MetronomFunctions {
//   var bpm = getSliderBpm.sliderBpmVal();

//   playClick() {
//     // if(!isRunning){
//     clickTimer(timerPer);
//     // }
//     // if (isRunning) {
//     // timer.cancel();
//   }

//   stopClick() {
//     clickUntimer(timerPer, player);
//   }
//   // checkIt.getTwelth()
// }

// clickTimer(timer) {
//   timer;
// }

// clickUntimer(timerPer, player) {
//   if (timerPer.isActive) {
//     timerPer.cancel();
//     player.stop();
//   } else {
//     clickTimer(timerPer);
//   }
// }


  //  void _startTimer() {
  //   // Disable the button after it has been pressed
  //   setState(() {
  //     _isButtonPressed = true;
  //   });
// }



//    void _startTimer() {
//     // Disable the button after it has been pressed
//     setState(() {
//       _isButtonPressed = true;
//     });
// }



// import 'dart:async';
// import 'dart:math';
// import 'package:audioplayers/audioplayers.dart';

// import '../control/slider_bpm.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// SliderBpm sliderBpm = const SliderBpm();
// GetSliderBpm getSliderBpm = GetSliderBpm();

// class MetronomFunctions extends StatefulWidget {
//   State<MetronomFunctions> createState() => _MetronomFunctionsState();
// }

// class _MetronomFunctionsState extends State<MetronomFunctions> {
//   int _lastFrameTime = 0;
//   Timer? _tickTimer;
//   Timer? _frameTimer;
//   int? _lastEvenTick;
//   bool? _lastTickWasEven;
// final player = AudioPlayer();

//   void start() {
//     var bpm = getSliderBpm.sliderBpmVal();
//     final int _tickInterval = 60000 ~/ bpm;

//     _lastEvenTick = DateTime.now().millisecondsSinceEpoch;
//     _tickTimer = Timer.periodic(Duration(milliseconds: _tickInterval), _onTick);
//     print("Click");
//     SystemSound.play(SystemSoundType.click);
//   }

//   void _onTick(Timer t) {
//     bool _lastTickWasEven = false;
//     t.tick % 2 == 0 ? _lastTickWasEven == true : false;
//     if (_lastTickWasEven = true)
//       _lastEvenTick = DateTime.now().millisecondsSinceEpoch;

//     if (player.plays = true) {
//       SystemSound.play(SystemSoundType.click);
//     } else {
//       _tickTimer?.cancel();
//     }
//   }

//   void _stop() {
//     if (mounted) setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     var isPlaying = false;
//     return ();
//   }

//   @override
//   void dispose() {
//     _frameTimer?.cancel();
//     _tickTimer?.cancel();
//     super.dispose();
//   }
// }