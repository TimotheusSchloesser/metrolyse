import 'package:flutter/material.dart';
import 'package:metrolyse/ui_components/constants.dart';
import 'control/mouse_over.dart';
import 'control/round_button.dart';
import 'control/slider_bpm.dart';
import 'metrolyse_stats.dart';
import 'model/animation.dart';
import 'model/key_press.dart';
import 'model/metronome_funktion.dart';
import 'model/visual_check.dart';

// MetronomeFunction metronomeFunction = MetronomeFunction();

GetKeyPress getKeyPress = GetKeyPress();

var cont = getKeyPress.keyPressVal();

class MetrolyseHome extends StatefulWidget {
  const MetrolyseHome({super.key});

  @override
  State<MetrolyseHome> createState() => _MetrolyseHomeState();
}

class _MetrolyseHomeState extends State<MetrolyseHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Metrolyse',
            style: mainRegularTextStyle,
          ),
        ),
        body: const Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [MetronomeFunction()],
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: SliderBpm(),
          ),
          VisualCheck(),
          ButtonStats(),
          MouseOverOne(),
          KeyPress(),
        ]));
  }
}

class ButtonStats extends StatelessWidget {
  const ButtonStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      color: innerButtonColor,
      content: const Icon(
        Icons.insert_chart_outlined_sharp,
        size: 60,
      ),
      isTapped: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MetrolyseStats(),
            ));
      },
    );
  }
}

class MouseOverOne extends StatelessWidget {
  const MouseOverOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseOver(
        label: 'Test',
        color1: innerButtonColor,
        color2: Colors.black54,
        onPressed: () {
          print(getKeyPress.keyPressVal());
          getClick();
          print(getClick());
        });
  }
}

getClick() {
  return true;
}
// class ButtonStop extends StatelessWidget {
//   const ButtonStop({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return RoundButton(
//         color: innerButtonColor,
//         content: const Icon(
//           Icons.stop_circle_outlined,
//           size: 60,
//         ),
//         isTapped: () {});
//   }
// }