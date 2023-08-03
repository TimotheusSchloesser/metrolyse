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
    int idI = inputs["id"];
    inputs["id"]++;
    // int date = 10;
    double date = ~DateTime.now().millisecondsSinceEpoch * factorToSeeVal;

    if (isPlaying && inputs.length <= 12) {
      inputs[idI] = date;
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
  }

  metroDates() {
    double metroSum = sumValues(metroMap, metroMap.length);
    int id = metroMap["id"];
    metroMap["id"]++;
    double clickDate = ~metronomeFunction.getMetroDates() * factorToSeeVal;
    if (isPlaying && inputs.length <= 12) {
      metroMap[id] = clickDate;
      if (inputs.length == 11) {
        double metroSum = sumValues(metroMap, metroMap.length);
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

  getDiv() {
    if (inputs.length == 11) {
      double met = metroDates();
      double imp = getInputs();
      double div = met - imp;
      return div;
    }
  }
}
