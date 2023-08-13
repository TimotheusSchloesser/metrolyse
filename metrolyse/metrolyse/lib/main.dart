import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metrolyse/constants/constants.dart';

import 'metrolyse_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const Metrolyse()));
}

class Metrolyse extends StatelessWidget {
  const Metrolyse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Metrolyse',
        theme: ThemeData.dark().copyWith(
            primaryColor: midColor,
            scaffoldBackgroundColor: groundColor,
            textTheme:
                Theme.of(context).textTheme.apply(fontFamily: 'Sansation')),
        home: const MetrolyseHome());
  }
}
