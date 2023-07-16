import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // #docregion addListener
    const SingleActivator(LogicalKeyboardKey.keyR, shift: true, control: true);
    if (SingleActivator == true) {
      animation = Tween<double>(begin: 0, end: 300).animate(controller)
        ..addListener(() {
          // #enddocregion addListener

          setState(() {
            // The state that has changed here is the animation object’s value.
          });
          // #docregion addListener
        });
      // #enddocregion addListener
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
