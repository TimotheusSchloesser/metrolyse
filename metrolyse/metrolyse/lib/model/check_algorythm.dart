import '../control/click_start_stop_button.dart';
import 'metronome_funktion.dart';

MetronomeFunctionState metronomeFunction = MetronomeFunctionState();
//Constants
const double factorToSeeVal = 0.1; // Factor to manipulate the Date values
const int lengthValToSum = 2; // How many rounds to wait till sum the map values

// Class to get the Methods to check the Differenz of to Maps of Dates.since
class CheckAlgo {
  Map inputs = {"id": 0};
  Map metroMap = {"id": 0};
  // Map allDiv = {};

/*
 * The Addition of a Map values
 * @param map - The map to get through.
 * @param length - map.length
 * 
 * @return result - The Result of the map values.
 */
  sumValues(Map map, length) {
    Iterable values = map.values;
    num result = values.reduce((sum, value) => sum + value);
    result = result / length - 1;
    return result;
  }

/*
 * The Sum of a Map values
 * @param map - The map to get through.
 * @param date - The concrete sinceEpch Value
 * 
 * @return result - The Result of the map values.
 */
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

// The Input Map
  getInputs() =>
      getMapsSums(inputs, DateTime.now().millisecondsSinceEpoch.toDouble());

// The Metronome Map
  metroDates() =>
      getMapsSums(metroMap, metronomeFunction.getMetroDates().toDouble());

/*
*Subtracts the calculated sums of the two maps
* @return div - The Differenz, if 0 there is no difference
* or the difference is to high, cause of async Methods
*/
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
