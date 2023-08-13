// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:metrolyse/constants/constants.dart';
// import 'package:metrolyse/model/check_algorythm.dart';
// import 'package:sensors_plus/sensors_plus.dart';

// import '../model/visual_check.dart';

// VisualCheckState visualCheckState = VisualCheckState();
// CheckAlgo checkAlgo = CheckAlgo();

// class AccelControl extends StatefulWidget {
//   const AccelControl({super.key});

//   @override
//   State<AccelControl> createState() => AccelControlState();
// }

// class AccelControlState extends State<AccelControl> {
//   List<double>? userAccelerometerValues;

//   final streamSubscriptions = <StreamSubscription<dynamic>>[];

//   @override
//   Widget build(BuildContext context) {
//     final userAccelerometer = userAccelerometerValues
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
//     for (final subscription in streamSubscriptions) {
//       subscription.cancel();
//     }
//   }

//   static double x = 0.004;
//   void accState(UserAccelerometerEvent event) {
//     return setState(() {
//       accelControl.userAccelerometerValues = <double>[
//         event.x,
//         event.y,
//         event.z
//       ];
//       if (event.x >= x || event.y >= x || event.z >= x) {
//         print("event.x");
//         if (checkAlgo.inputs.length == 11) {
//           double check = checkAlgo.printInput() + regWidth * 0.5;
//           visualCheckState.start(check);
//         }
//         checkAlgo.getInputs();
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     streamSubscriptions.add(
//       userAccelerometerEvents.listen(
//         (UserAccelerometerEvent event) {
//           accState(event);
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
