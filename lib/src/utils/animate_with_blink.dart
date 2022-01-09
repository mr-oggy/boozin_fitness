import 'package:flutter/material.dart';

class AnimateWithBlink extends StatelessWidget {
  const AnimateWithBlink({required this.visible, required this.child, Key? key}) : super(key: key);
  final bool visible;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1500),
      child: child,
    );
  }
}
