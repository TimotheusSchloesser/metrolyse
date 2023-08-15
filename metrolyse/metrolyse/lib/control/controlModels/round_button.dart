import 'package:flutter/material.dart';

// Round Button Model
class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      required this.color,
      required this.content,
      required this.isTapped});

  final Color color;
  final Widget content;
  final VoidCallback isTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isTapped,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(70)),
        child: content,
      ),
    );
  }
}
