import 'package:flutter/material.dart';
import 'package:metrolyse/model/metronome_funktion.dart';

import '../control/motion_input.dart';

MetronomeFunctionState metronomeFunctionState = MetronomeFunctionState();

class CheckAlgo extends StatefulWidget {
  const CheckAlgo({
    super.key,
    // required this.inputId, this.inputDate
  });
  // final int inputId;
  // final DateTime? inputDate;

  @override
  State<CheckAlgo> createState() => CheckAlgoState();
}

class CheckAlgoState extends State<CheckAlgo> {
  @override
  Widget build(BuildContext context) {
    return getTwelth();
  }

  getTwelth() async {
    InsteadMotionButton(
      isTapped: () {
        // var metro = metronomeFunctionState.getTimerActive();
        // var _metro = metro += metro;

        // print(_metro);
      },
    );
    // int metro = 2;
    // metronomeFunctionState.getTimerActive();
    // getInputs().forEach((input) => {metro = metro * 2, print(metro)});
  }

  // getInputs() {}
}



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