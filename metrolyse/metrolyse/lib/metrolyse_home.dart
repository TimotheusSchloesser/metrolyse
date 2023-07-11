import 'package:flutter/material.dart';
import 'package:metrolyse/ui_components/constants.dart';
import 'control/round_button.dart';
import 'control/slider_bpm.dart';
import 'metrolyse_stats.dart';

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
            children: [ButtonPlay(), ButtonStop()],
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: SliderBpm(),
          ),
          ButtonStats(),
        ]));
  }
}

class ButtonPlay extends StatelessWidget {
  const ButtonPlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      color: innerButtonColor,
      content: const Icon(
        Icons.play_circle_filled_outlined,
        size: 60,
      ),
      isTapped: () {},
    );
  }
}

class ButtonStop extends StatelessWidget {
  const ButtonStop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundButton(
        color: innerButtonColor,
        content: const Icon(
          Icons.stop_circle_outlined,
          size: 60,
        ),
        isTapped: () {});
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

// class Player {
//   static play(String src) async {
//     final player = AudioPlayer();
//     await player.play(AssetSource('audio/click.wav'));
//   }
// }
