import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedContainer].

class AnimationBall extends StatefulWidget {
  const AnimationBall({super.key});

  @override
  State<AnimationBall> createState() => AnimationBallState();
}

class AnimationBallState extends State<AnimationBall> {
  double targetValue = 211.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: targetValue),
        duration: const Duration(seconds: 1),
        builder: (BuildContext context, double size, Widget? child) {
          return IconButton(
            iconSize: size,
            color: Colors.blue,
            icon: child!,
            onPressed: () {
              setState(() {
                targetValue = targetValue == 24.0 ? 100.0 : 24.0;
              });
            },
          );
        },
        child: const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 251, 252, 252),
          radius: 100,
        ));
  }
}
