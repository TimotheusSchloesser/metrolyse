import 'package:flutter/material.dart';
import '../ui_components/constants.dart';
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

  selectedVal() {
    return selected;

    // notifyListeners();

    // selected = false;
  }

  @override
  Widget build(BuildContext context) {
    return MyIconButton(
        iconSize: 50,
        splashRadius: 50,
        splashColor: innerButtonColor,
        icon: const Icon(Icons.ads_click_rounded),
        isPressed: widget.isTapped);
  }
}
