// import 'package:flutter/material.dart';
// import 'package:metrolyse/model/metronome_funktion.dart';
// import 'package:metrolyse/model/visual_check.dart';

// VisualCheckState visualCS = VisualCheckState();

// class CheckAlgo extends StatelessWidget {
//   const CheckAlgo(inputs, {
//     super.key,
//     required this.id,
//     required this.date,
//   });

//   final DateTime date;
//   final dynamic id;

//   @override
//   Widget build(BuildContext context) {
//     return CheckAlgo(id, date: DateTime.now(), id: null, );
//   }


   //The time of input and the metronome time come together
//   getTwelth() {
//     visualCS.getInputs().forEach(inputs) => {
//       let metro = getTimer()
//       if (input.id < 12) {
//         input.date += input.date
//         metro += metro
//       } else { counterPart(input.date, input.id, metro) }

//     })
//   }

// }




// import { getTimer, getBpm } from './metronomControl.js'
// import { getInputs } from './acceleration.js'

// export class Input {
//   constructor(id, date) {
//     this.id = id
//     this.date = performance.now()
//   }


//   // The time of input and the metronome time come together
//   getTwelth() {
//     getInputs().forEach(input => {
//       let metro = getTimer()
//       if (input.id < 12) {
//         input.date += input.date
//         metro += metro
//       } else { counterPart(input.date, input.id, metro) }

//     })
//   }

// }

// var checkSum


// function counterPart(dates, ids, metros) {
//   checkSum = Math.round(dates - metros)
//   getInputs().length = 0
//   statistics()
// }

// // How tight can You get from start to stop from 0 the best to whatever
// function statistics() {
//   let checkStats = sumToCanvas()
//   checkStats += checkStats
//   console.log(checkStats + "  " + sumToCanvas())
//   return checkStats
// }

// //Just the export to get the checksum attribute.
// export function sumToCanvas() {
//   return checkSum
// }