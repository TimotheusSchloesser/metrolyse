import 'package:flutter/material.dart';
import 'package:metrolyse/ui_components/constants.dart';
import 'control/controlModels/round_button.dart';
import 'metrolyse_stats.dart';

import 'model/metronome_funktion.dart';
import 'model/visual_check.dart';

// MetronomeFunction metronomeFunction = MetronomeFunction();

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
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MetronomeFunction(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              VisualCheck(),
            ],
          ),
          ButtonStats(),
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
