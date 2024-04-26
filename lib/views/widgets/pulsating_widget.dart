import 'package:flutter/material.dart';

class PulsatingWidget extends StatefulWidget {
  final Widget child;
  final bool isAnimate;

  const PulsatingWidget({super.key, required this.child, required this.isAnimate});

  @override
  _PulsatingWidgetState createState() => _PulsatingWidgetState();
}

class _PulsatingWidgetState extends State<PulsatingWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isAnimate
        ? ScaleTransition(
            scale: TweenSequence(
              <TweenSequenceItem<double>>[
                TweenSequenceItem<double>(
                  tween: Tween<double>(begin: 1.0, end: 1.2),
                  weight: 1,
                ),
                TweenSequenceItem<double>(
                  tween: Tween<double>(begin: 1.2, end: 1.0),
                  weight: 1,
                ),
              ],
            ).animate(_controller),
            child: widget.child)
        : widget.child;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
