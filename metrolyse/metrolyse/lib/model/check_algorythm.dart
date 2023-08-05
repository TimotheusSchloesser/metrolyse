import 'package:metrolyse/model/visual_check.dart';

import '../control/click_start_stop_button.dart';

const double factorToSeeVal = 0.00000001;
const int lengthValToSum = 4;

class CheckAlgo {
  Map inputs = {"id": 0};
  Map metroMap = {"id": 0};
  Map allDiv = {};

  sumValues(Map map, length) {
    Iterable values = map.values;
    num result = values.reduce((sum, value) => sum + value);
    result = result / length - 1;
    return result;
  }

  getMapsSums(Map map, double date) {
    double mapSum = sumValues(map, map.length);
    int id = map["id"];
    map["id"]++;
    double dateSum = date * factorToSeeVal;
    if (isPlaying && map.length <= lengthValToSum) {
      map[id] = dateSum;
      if (map.length == lengthValToSum - 1) {
        mapSum = sumValues(map, map.length);
        return mapSum;
      }
    } else {
      map.clear();
      map["id"] = 0;
      map[0] = dateSum;
      map["id"]++;
    }
    return mapSum;
  }

  getInputs() =>
      getMapsSums(inputs, DateTime.now().millisecondsSinceEpoch.toDouble());
  metroDates() =>
      getMapsSums(metroMap, metronomeFunction.getMetroDates().toDouble());

  getDiv() {
    if (inputs.length == lengthValToSum - 1) {
      double met = metroDates();
      double imp = getInputs();
      double div = met - imp;
      return div;
    }
  }
}




 // metroDates() {
  //   double metroSum = sumValues(metroMap, metroMap.length);
  //   int id = metroMap["id"];
  //   metroMap["id"]++;
  //   double clickDate = metronomeFunction.getMetroDates() * factorToSeeVal;
  //   if (isPlaying && inputs.length <= 12) {
  //     metroMap[id] = clickDate;
  //     if (inputs.length == 11) {
  //       double metroSum = sumValues(metroMap, metroMap.length);
  //       return metroSum;
  //     }
  //   } else {
  //     metroMap.clear();
  //     metroMap["id"] = 0;
  //     metroMap[0] = clickDate;
  //     metroMap["id"]++;
  //   }
  //   return metroSum;
  // }


  // getInputs() {
  //   double inputSum = sumValues(inputs, inputs.length);
  //   int idI = inputs["id"];
  //   inputs["id"]++;
  //   double date = ~DateTime.now().millisecondsSinceEpoch * factorToSeeVal;

  //   if (isPlaying && inputs.length <= 12) {
  //     inputs[idI] = date;
  //     if (inputs.length == 11) {
  //       double inputSum = sumValues(inputs, inputs.length);
  //       return inputSum;
  //     }
  //   } else {
  //     inputs.clear();
  //     inputs["id"] = 0;
  //     inputs[0] = date;
  //     inputs["id"]++;
  //   }
  //   return inputSum;
  // }