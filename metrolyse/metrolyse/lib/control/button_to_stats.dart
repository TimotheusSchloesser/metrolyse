import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../metrolyse_stats.dart';
import 'controlModels/round_button.dart';

// Button to Upcomming TrainDiary
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
            MaterialPageRoute(builder: (context) => const MetrolyseStats()));
      },
    );
  }
}
