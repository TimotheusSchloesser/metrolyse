import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../metrolyse_home.dart';
import 'controlModels/round_button.dart';

class ButtonToMetro extends StatelessWidget {
  const ButtonToMetro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      color: backgroundColor,
      content: const Icon(
        Icons.arrow_back,
        size: regIconSize,
      ),
      isTapped: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MetrolyseHome()));
      },
    );
  }
}
