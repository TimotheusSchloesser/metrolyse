// // import 'package:flutter/material.dart';
// // import '../model/metronome_funktion.dart';

// // bool isPlaying = false;
// // MetronomeFunction metronomeFunction = MetronomeFunction();

// // class StartStopBtn extends StatefulWidget {
// //   const StartStopBtn({super.key});

// //   @override
// //   State<StartStopBtn> createState() => StartStopBtnState();
// // }

// // class StartStopBtnState extends State<StartStopBtn> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return playStopFunc();
// //   }

// //   IconButton playStopFunc() {
// //     return IconButton(
// //         icon: isPlaying
// //             ? const Icon(Icons.play_circle_outline_outlined)
// //             : const Icon(
// //                 Icons.stop_circle_outlined,
// //               ),
// //         onPressed: () {
// //           setState(() {
// //             // Here we changing the icon.
// //             isPlaying = !isPlaying;
// //             if (isPlaying) {
// //               metronomeFunction.playClick();
// //             } else {}
// //           });
// //         });
// //   }
// // }

// // class GetClickP with ChangeNotifier {
// //   clickplays() {
// //     print(isPlaying);
// //     return isPlaying;
// //   }
// // }



// class _YourContainerState extends State<YourContainer> {
//   int height = 5;
//   int width = 2;

//   HelperClass helper;

//   @override
//   void initState() {
//     helper = HelperClass(
//       height: height,
//       width: width,
//     );
//     super.initState();
//   }
  
//   ...
//    onChanged: (newValue) {
//           if (newValue.isEmpty) {
//             newValue = "0";
//           }
//           setState(() {
//             height = int.tryParse(newValue);
//             helper.height = height;
//           });

//           print(height); // State changed OK
//         },

// working demo

// enter image description here

// full code

// import 'package:flutter/material.dart';

// class HelperClass {
//   int height;
//   int width;
//   HelperClass({
//     this.height,
//     this.width,
//   });

//   int calculate() {
//     //print(longitude); // This value doesn't change despite setState is used in the other class
//     return height * width;
//   }
// }

// class YourContainer extends StatefulWidget {
//   @override
//   _YourContainerState createState() => _YourContainerState();
// }

// class _YourContainerState extends State<YourContainer> {
//   int height = 5;
//   int width = 2;

//   HelperClass helper;

//   @override
//   void initState() {
//     helper = HelperClass(
//       height: height,
//       width: width,
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       TextFormField(
//         onChanged: (newValue) {
//           if (newValue.isEmpty) {
//             newValue = "0";
//           }
//           setState(() {
//             height = int.tryParse(newValue);
//             helper.height = height;
//           });

//           print(height); // State changed OK
//         },
//       ),
//       Text('Result: ${helper.calculate()}')
//     ]);
//   }
// }

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         visualDensity: VisualDensity.adaptivePlatformDensity,
// //       ),
// //       home: MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({Key key, this.title}) : super(key: key);

// //   final String title;

// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;

// //   void _incrementCounter() {
// //     setState(() {
// //       _counter++;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //       ),
// //       body: Center(child: YourContainer()),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }

// // }