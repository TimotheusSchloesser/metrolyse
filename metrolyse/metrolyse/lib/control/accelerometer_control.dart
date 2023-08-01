// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:metrolyse/constants/constants.dart';
// import 'package:metrolyse/model/check_algorythm.dart';
// import 'package:sensors_plus/sensors_plus.dart';

// import '../model/visual_check.dart';

// VisualCheckState visualCheckState = VisualCheckState();
// CheckAlgo checkAlgo = CheckAlgo();

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   List<double>? _userAccelerometerValues;

//   final _streamSubscriptions = <StreamSubscription<dynamic>>[];

//   @override
//   Widget build(BuildContext context) {
//     final userAccelerometer = _userAccelerometerValues
//         ?.map((double v) => v.toStringAsFixed(1))
//         .toList();
//     return Text(
//       'Accelerometer: $userAccelerometer',
//       style: const TextStyle(fontSize: 50, color: frontColor),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     for (final subscription in _streamSubscriptions) {
//       subscription.cancel();
//     }
//   }

//   static double x = 0.004;
//   getAcceleration() {}

//   @override
//   void initState() {
//     super.initState();
//     _streamSubscriptions.add(
//       userAccelerometerEvents.listen(
//         (UserAccelerometerEvent event) {
//           setState(() {
//             _userAccelerometerValues = <double>[event.x, event.y, event.z];
//             if (event.x >= x || event.y >= x || event.z >= x) {
//               print(event.x);
//               if (checkAlgo.inputs.length == 11) {
//                 double check = checkAlgo.printInput() + regWidth * 0.5;
//                 visualCheckState.start(check);
//               }
//               checkAlgo.getInputs();
//             }
//           });
//         },
//         onError: (e) {
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return const AlertDialog(
//                   title: Text("Sensor Not Found"),
//                   content: Text(
//                       "It seems that your device doesn't support Accelerometer Sensor"),
//                 );
//               });
//         },
//         cancelOnError: true,
//       ),
//     );
//   }
// }
