// import 'package:flutter/material.dart';
// import '../model/metronome_funktion.dart';

// bool isPlaying = false;
// MetronomeFunction metronomeFunction = MetronomeFunction();

// class StartStopBtn extends StatefulWidget {
//   const StartStopBtn({super.key});

//   @override
//   State<StartStopBtn> createState() => StartStopBtnState();
// }

// class StartStopBtnState extends State<StartStopBtn> {
//   @override
//   Widget build(BuildContext context) {
//     return playStopFunc();
//   }

//   IconButton playStopFunc() {
//     return IconButton(
//         icon: isPlaying
//             ? const Icon(Icons.play_circle_outline_outlined)
//             : const Icon(
//                 Icons.stop_circle_outlined,
//               ),
//         onPressed: () {
//           setState(() {
//             // Here we changing the icon.
//             isPlaying = !isPlaying;
//             if (isPlaying) {
//               metronomeFunction.playClick();
//             } else {}
//           });
//         });
//   }
// }

// class GetClickP with ChangeNotifier {
//   clickplays() {
//     print(isPlaying);
//     return isPlaying;
//   }
// }
