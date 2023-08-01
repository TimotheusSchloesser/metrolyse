import 'package:metrolyse/model/visual_check.dart';

import '../control/click_start_stop_button.dart';

class CheckAlgo {
  Map inputs = {"id": 0};
  Map metroMap = {"id": 0};
  static double factorToSeeVal = 0.00000001;

  sumValues(Map map, length) {
    Iterable values = map.values;
    num result = values.reduce((sum, value) => sum + value);
    result = result / length - 1;
    return result;
  }

  getInputs() {
    double inputSum = sumValues(inputs, inputs.length);
    int _id = inputs["id"];
    inputs["id"]++;
    // int date = 10;
    double date = ~DateTime.now().millisecondsSinceEpoch * factorToSeeVal;

    if (isPlaying && inputs.length <= 12) {
      inputs[_id] = date;
      // print(inputs["id"]);
      // print(_id);
      if (inputs.length == 11) {
        double inputSum = sumValues(inputs, inputs.length);
        // print("input $inputSum");
        return inputSum;
      }
    } else {
      inputs.clear();
      inputs["id"] = 0;
      inputs[0] = date;
      inputs["id"]++;
    }
    return inputSum;
    // int input = inputs.values.elementAt(inputs["id"]);
  }

  metroDates() {
    double metroSum = sumValues(metroMap, metroMap.length);
    int id = metroMap["id"];
    metroMap["id"]++;
    double clickDate = ~metronomeFunction.getMetroDates() * factorToSeeVal;
    if (isPlaying && inputs.length <= 12) {
      metroMap[id] = clickDate;
      if (inputs.length == 11) {
        // double metroDiff = sumMetroMapVal() / sumMetroMapId();
        // print(metroDiff);
        double metroSum = sumValues(metroMap, metroMap.length);
        // print("metro $metroSum");
        return metroSum;
      }
    } else {
      metroMap.clear();
      metroMap["id"] = 0;
      metroMap[0] = clickDate;
      metroMap["id"]++;
    }
    return metroSum;
  }

  printInput() {
    // print("input: ");
    // print(getInputs());
    if (inputs.length == 11) {
      double met = metroDates();
      double imp = getInputs();
      print("1. $imp - 2. $met");
      double div = met - imp;
      // print(div);
      return div;
    }
  }
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