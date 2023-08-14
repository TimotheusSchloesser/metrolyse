import '../control/click_start_stop_button.dart';
import '../model/metronome_funktion.dart';

const double factorToSeeVal = 0.1;
const int lengthValToSum = 2;

class CheckAlgo {
  MetronomeFunctionState metronomeFunction = MetronomeFunctionState();

  Map inputs = {"id": 0};
  Map metroMap = {"id": 0};

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
    double dateSum = date;
    if (isPlaying && metroMap.length < lengthValToSum) {
      map[id] = dateSum;
      if (metroMap.length == lengthValToSum) {
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
    if (inputs.length == lengthValToSum) {
      double div = metroDates() - getInputs();
      if (div >= 10000 || div <= -10000) {
        div = 0;
      }
      return div;
    }
  }
}
