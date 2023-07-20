import 'package:flutter/material.dart';

class StartStopBtn extends StatelessWidget {
  const StartStopBtn({
    super.key,
    required this.splashRadius,
    this.splashColor,
    required this.icon,
    required this.isPressed,
    this.iconSize,
    this.color,
  });

  final Widget icon;
  final VoidCallback isPressed;
  final double? iconSize;
  final double splashRadius;
  final Color? splashColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: isPressed,
      iconSize: iconSize,
      splashRadius: splashRadius,
      splashColor: splashColor,
      color: color,
    );
  }
}
