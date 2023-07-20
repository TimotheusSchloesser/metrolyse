import 'package:flutter/material.dart';

class MouseOver extends StatefulWidget {
  const MouseOver(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.color1,
      required this.color2})
      : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color color1;
  final Color color2;

  @override
  State<MouseOver> createState() => _MouseOverState();
}

class _MouseOverState extends State<MouseOver> {
  bool _isHovered = false;

  void _handleHoveHighlight(bool value) {
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    {
      Color bgColor = _isHovered ? widget.color1 : widget.color2;
      return GestureDetector(
          onTap: _handlePressed,
          child: FocusableActionDetector(
            mouseCursor: SystemMouseCursors.click,
            onShowHoverHighlight: _handleHoveHighlight,
            actions: <Type, Action<Intent>>{
              ActivateIntent:
                  CallbackAction<Intent>(onInvoke: (_) => _handlePressed()),
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: bgColor,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Text(widget.label),
            ),
          ));
    }
  }

  void _handlePressed() {
    widget.onPressed();
  }
}
