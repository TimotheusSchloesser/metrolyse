import 'package:flutter/material.dart';
import 'package:metrolyse/constants/constants.dart';
import 'control/button_to_stats.dart';
import 'control/sensibility_slider.dart';
import 'model/metronome_function.dart';
import 'model/visual_check.dart';

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
            ]),
          ),
        ));
  }
}
