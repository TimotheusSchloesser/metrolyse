import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'controlModels/icon_button.dart';

// VisualCheckState visualCheck = VisualCheckState();
var selected = false;

class InsteadMotionButton extends StatefulWidget {
  const InsteadMotionButton({super.key, required this.isTapped});
  final VoidCallback isTapped;
  @override
  State<InsteadMotionButton> createState() => InsteadMotionButtonState();
}

class InsteadMotionButtonState extends State<InsteadMotionButton> {
  // get isTapped => InsteadMotionButton.isTapped;

  // selectedVal() {
  //   return selected;
  // }

  @override
  Widget build(BuildContext context) {
    return MyIconButton(
        iconSize: regIconSize * 2,
        splashRadius: regIconSize,
        splashColor: midColor,
        icon: const Icon(Icons.ads_click_rounded),
        isPressed: widget.isTapped);
  }
}
