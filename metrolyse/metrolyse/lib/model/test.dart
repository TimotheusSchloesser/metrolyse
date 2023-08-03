// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:reliable_interval_timer/reliable_interval_timer.dart';

// // number of milliseconds in a minute
// const minute = 1000 * 60;
// const double _minimumTempoValue = 30;
// const double _maximumTempoValue = 200;
// const double _tempoIncrement = 10;
// const double tempoRange = _maximumTempoValue - _minimumTempoValue;
// const double _tempoDivisions = tempoRange / _tempoIncrement;

// const metronomeAudioPath =
//     'audio/243748__unfa__metronome-2khz-strong-pulse.wav';

// void main() {
//   runApp(const AeMetronome());
// }

// class AeMetronome extends StatelessWidget {
//   const AeMetronome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: 'Æ Khronos',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         brightness: Brightness.dark,
//       ),
//       home: const MetronomePage(title: 'Æ Khronos'),
//     );
//   }
// }

// class MetronomePage extends StatefulWidget {
//   const MetronomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MetronomePage> createState() => MetronomePageState();
// }

// // this is made public so it is visible in the unit test
// // Note: there may be a better way to test private state
// class MetronomePageState extends State<MetronomePage> {
//   double _tempo = 80;

//   // Used to toggle metronome click
//   // It is set to be a public member,
//   // so it is visible in the unit test
//   bool soundEnabled = true;

//   late ReliableIntervalTimer _timer;
//   // late AudioPlayer player;
//   static AudioPlayer player = AudioPlayer();

//   final ButtonStyle _buttonStyle = ButtonStyle(
//     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//       RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//     ),
//   );

//   int _calculateTimerInterval(int tempo) {
//     double timerInterval = minute / tempo;

//     return timerInterval.round();
//   }

//   void onTimerTick(int elapsedMilliseconds) async {
//     if (soundEnabled) {
//       player.play(AssetSource(metronomeAudioPath));
//     }
//   }

//   ReliableIntervalTimer _scheduleTimer([int milliseconds = 10000]) {
//     return ReliableIntervalTimer(
//       interval: Duration(milliseconds: milliseconds),
//       callback: onTimerTick,
//     );
//   }

//   @override
//   void initState() {
//     super.initState();

//     _timer = _scheduleTimer(_calculateTimerInterval(_tempo.round()));

//     _timer.start();
//   }

//   @override
//   void dispose() {
//     _timer.stop();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               _tempo.round().toString(),
//               style: Theme.of(context).textTheme.headline1,
//             ),
//             Slider(
//               value: _tempo,
//               min: _minimumTempoValue,
//               max: _maximumTempoValue,
//               divisions: _tempoDivisions.round(),
//               label: _tempo.round().toString(),
//               onChanged: (double value) async {
//                 await _timer.stop();

//                 setState(() {
//                   _tempo = value;
//                 });
//               },
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 OutlinedButton(
//                   style: _buttonStyle,
//                   onPressed: () async {
//                     _timer = _scheduleTimer(
//                       _calculateTimerInterval(_tempo.round()),
//                     );

//                     await _timer.start();
//                   },
//                   child: const Icon(
//                     Icons.play_arrow,
//                   ),
//                 ),
//                 OutlinedButton(
//                   style: _buttonStyle,
//                   onPressed: () async {
//                     await _timer.stop();
//                   },
//                   child: const Icon(
//                     Icons.stop,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';

// // class MyApp extends StatelessWidget {
// //   final List<ListItem> items;

// //   const MyApp({super.key, required this.items});

// //   @override
// //   Widget build(BuildContext context) {
// //     const title = 'Mixed List';

// //     return MaterialApp(
// //       title: title,
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text(title),
// //         ),
// //         body: ListView.builder(
// //           // Let the ListView know how many items it needs to build.
// //           itemCount: items.length,
// //           // Provide a builder function. This is where the magic happens.
// //           // Convert each item into a widget based on the type of item it is.
// //           itemBuilder: (context, index) {
// //             final item = items[index];

// //             return ListTile(
// //               title: item.buildTitle(context),
// //               subtitle: item.buildSubtitle(context),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// // /// The base class for the different types of items the list can contain.
// // abstract class ListItem {
// //   /// The title line to show in a list item.
// //   Widget buildTitle(BuildContext context);

// //   /// The subtitle line, if any, to show in a list item.
// //   Widget buildSubtitle(BuildContext context);
// // }

// // /// A ListItem that contains data to display a heading.
// // class HeadingItem implements ListItem {
// //   final String heading;

// //   HeadingItem(this.heading);

// //   @override
// //   Widget buildTitle(BuildContext context) {
// //     return Text(
// //       heading,
// //       style: Theme.of(context).textTheme.headlineSmall,
// //     );
// //   }

// //   @override
// //   Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
// // }

// // /// A ListItem that contains data to display a message.
// // class MessageItem implements ListItem {
// //   final String sender;
// //   final String body;

// //   MessageItem(this.sender, this.body);

// //   @override
// //   Widget buildTitle(BuildContext context) => Text(sender);

// //   @override
// //   Widget buildSubtitle(BuildContext context) => Text(body);
// // }


// // import 'package:flutter/material.dart';

// // import '../control/start_stop_button.dart';

// // class OnOffClickBody extends StatelessWidget {
// //   const OnOffClickBody({super.key, required this.clickNotifier});

// //   final ClickModel clickNotifier;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: <Widget>[
// //           const Text('Current counter value:'),
// //           // Thanks to the ListenableBuilder, only the widget displaying the
// //           // current count is rebuilt when counterValueNotifier notifies its
// //           // listeners. The Text widget above and CounterBody itself aren't
// //           // rebuilt.
// //           listener(),
// //         ],
// //       ),
// //     );
// //   }

// //   ListenableBuilder listener() {
// //     return ListenableBuilder(
// //       listenable: clickNotifier,
// //       builder: (BuildContext context, Widget? child) {
// //         return Text('${clickNotifier.onOffClick}');
// //       },
// //     );
// //   }
// // }

// // class MouseOverOne extends StatelessWidget {
// //   const MouseOverOne({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return MouseOver(
// //         label: 'Test',
// //         color1: innerButtonColor,
// //         color2: Colors.black54,
// //         onPressed: () {
// //           print(getKeyPress.keyPressVal());
// //           getClick();
// //           print(getClick());
// //         });
// //   }
// // }

// // getClick() {
// //   return true;
// // }
// // class ButtonStop extends StatelessWidget {
// //   const ButtonStop({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return RoundButton(
// //         color: innerButtonColor,
// //         content: const Icon(
// //           Icons.stop_circle_outlined,
// //           size: 60,
// //         ),
// //         isTapped: () {});
// //   }
// // }

// // import 'package:flutter/material.dart';

// // /// Flutter code sample for [AnimatedContainer].

// // class AnimationBall extends StatefulWidget {
// //   const AnimationBall({super.key});

// //   @override
// //   State<AnimationBall> createState() => AnimationBallState();
// // }

// // class AnimationBallState extends State<AnimationBall> {
// //   double targetValue = 211.0;

// //   @override
// //   Widget build(BuildContext context) {
// //     return TweenAnimationBuilder<double>(
// //         tween: Tween<double>(begin: 0, end: targetValue),
// //         duration: const Duration(seconds: 1),
// //         builder: (BuildContext context, double size, Widget? child) {
// //           return IconButton(
// //             iconSize: size,
// //             color: Colors.blue,
// //             icon: child!,
// //             onPressed: () {
// //               setState(() {
// //                 targetValue = targetValue == 24.0 ? 100.0 : 24.0;
// //               });
// //             },
// //           );
// //         },
// //         child: const CircleAvatar(
// //           backgroundColor: Color.fromARGB(255, 251, 252, 252),
// //           radius: 100,
// //         ));
// //   }
// // }


// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';

// // /// Flutter code sample for [LogicalKeySet].
// // int count = 0;

// // class KeyPress extends StatelessWidget {
// //   const KeyPress({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const Center(
// //       child: LogicalKeySetExample(),
// //     );
// //   }
// // }

// // class IncrementIntent extends Intent {
// //   const IncrementIntent();
// // }

// // class LogicalKeySetExample extends StatefulWidget {
// //   const LogicalKeySetExample({super.key});

// //   @override
// //   State<LogicalKeySetExample> createState() => _LogicalKeySetExampleState();
// // }

// // class _LogicalKeySetExampleState extends State<LogicalKeySetExample> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Shortcuts(
// //       shortcuts: <ShortcutActivator, Intent>{
// //         LogicalKeySet(LogicalKeyboardKey.keyC, LogicalKeyboardKey.controlLeft):
// //             const IncrementIntent(),
// //       },
// //       child: Actions(
// //         actions: <Type, Action<Intent>>{
// //           IncrementIntent: CallbackAction<IncrementIntent>(
// //             onInvoke: (IncrementIntent intent) => setState(() {
// //               count = count + 1;
// //             }),
// //           ),
// //         },
// //         child: Focus(
// //           autofocus: true,
// //           child: Column(
// //             children: <Widget>[
// //               const Text(
// //                 'Add to the counter by pressing Ctrl+C',
// //                 style: TextStyle(
// //                   color: Colors.blue,
// //                 ),
// //               ),
// //               Text(
// //                 'count: $count',
// //                 style: const TextStyle(
// //                   color: Colors.blue,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class GetKeyPress with ChangeNotifier {
// //   keyPressVal() {
// //     var count1 = count;
// //     return count1;
// //   }
// // }


// // import 'dart:async';
// // import 'package:metrolyse/model/audio_play.dart';

// // import '../control/slider_bpm.dart';
// // import 'package:flutter/material.dart';

// // import '../control/start_stop_button.dart';
// // import '../ui_components/constants.dart';
// // // import '../control/start_stop_button.dart';

// // GetSliderBpm getSliderBpm = GetSliderBpm();
// // ClickModel clickModel = ClickModel();
// // AudioPlay audioPlay = AudioPlay();

// // enum ClickState { Plays, Stopped }

// // class PerTimer extends StatefulWidget {
// //   const PerTimer({super.key});
// //   @override
// //   State<PerTimer> createState() => _PerTimerState();
// // }

// // class _PerTimerState extends State<PerTimer> {
// //   ClickState _clickState = ClickState.Stopped;

// //   bool isPlaying = false;

// //   final Duration clickDuration =
// //       Duration(milliseconds: 60000 ~/ getSliderBpm.sliderBpmVal());

// //   Timer? _clickTimer;

// //   final clickNotifier = clickModel;

  

// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   startClick() async {
// //     _clickState = ClickState.Plays;
// //     _clickTimer =
// //         Timer.periodic(clickDuration, (timer) => audioPlay.playClick());
// //     if (mounted) setState(() {});
// //   }

// //   void stopClick() {
// //     _clickState = ClickState.Stopped;
// //     audioPlay.muteClick();
// //     _clickTimer?.cancel();
// //     if (mounted) setState(() {});
// //   }

// //   clickController() {
// //     if (clickModel.onOffClick() == true) {
// //       startClick();
// //     } else {
// //       stopClick();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(child: <Widget>[])
// //   }
// // }
// // class Clicker extends ChangeNotifier {
// //   var _count = 0;
// //   int get getCounter {
// //     return _count;
// //   }