import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Flutter code sample for [LogicalKeySet].
int count = 0;

class KeyPress extends StatelessWidget {
  const KeyPress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LogicalKeySetExample(),
    );
  }
}

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class LogicalKeySetExample extends StatefulWidget {
  const LogicalKeySetExample({super.key});

  @override
  State<LogicalKeySetExample> createState() => _LogicalKeySetExampleState();
}

class _LogicalKeySetExampleState extends State<LogicalKeySetExample> {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        LogicalKeySet(LogicalKeyboardKey.keyC, LogicalKeyboardKey.controlLeft):
            const IncrementIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          IncrementIntent: CallbackAction<IncrementIntent>(
            onInvoke: (IncrementIntent intent) => setState(() {
              count = count + 1;
            }),
          ),
        },
        child: Focus(
          autofocus: true,
          child: Column(
            children: <Widget>[
              const Text(
                'Add to the counter by pressing Ctrl+C',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              Text(
                'count: $count',
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GetKeyPress with ChangeNotifier {
  keyPressVal() {
    var count1 = count;
    return count1;
  }
}
