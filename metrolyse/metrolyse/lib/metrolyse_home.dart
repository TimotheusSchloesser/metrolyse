import 'package:flutter/material.dart';
import 'package:metrolyse/constants/constants.dart';
import 'control/controlModels/round_button.dart';

import 'control/sensibility_slider.dart';
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
          backgroundColor: backgroundColor,
          title: const Center(
            child: Text(
              'Metrolyse',
              style: titelTextStyle,
            ),
          ),
        ),
        body: const FittedBox(
          child: Padding(
            padding: EdgeInsets.all(50.0),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MetronomeFunction(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  VisualCheck(),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ButtonStats(),
                    Padding(
                      padding: EdgeInsets.only(left: 200.0),
                      child: SensSlider(),
                    ),
                  ],
                ),
              ),

              // MyHomePage(),
            ]),
          ),
        ));
  }
}

class ButtonStats extends StatelessWidget {
  const ButtonStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      color: backgroundColor,
      content: const Icon(
        Icons.insert_chart_outlined_sharp,
        size: regIconSize,
      ),
      isTapped: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MetrolyseStats())
            // MyApp(
            //     items: List<ListItem>.generate(
            //       12,
            //       (i) => i % 6 == 0
            //           ? HeadingItem('Heading $i')
            //           : MessageItem('Sender $i', 'Message body $i'),
            //     ),
            //   ),
            // ),
            );
      },
    );
  }
}
