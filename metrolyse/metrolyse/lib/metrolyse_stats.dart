import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metrolyse/ui_components/constants.dart';

import 'control/round_button.dart';

class MetrolyseStats extends StatefulWidget {
  const MetrolyseStats({super.key});

  @override
  State<MetrolyseStats> createState() => _MetrolyseStats();
}

class _MetrolyseStats extends State<MetrolyseStats> {
  Offset offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('AnimatedSlide Sample'),
            automaticallyImplyLeading: false),
        body: Column(children: [
          Row(children: [
            Expanded(
                child: Slider(
              min: 0.0,
              max: 250.0,
              value: offset.dx,
              onChanged: (double value) {
                setState(() {
                  offset = Offset(value, offset.dy);
                });
              },
            ))
          ]),
          const ButtonBack(),
        ]));
  }
}

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      color: innerButtonColor,
      content: const Icon(
        Icons.home_filled,
        size: 60,
      ),
      isTapped: () {
        Navigator.pop(context);
        SystemSound.play(SystemSoundType.click);
      },
    );
  }
}
