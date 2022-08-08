import 'dart:math';

import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  final FlipCardController controller;
  final Image front;
  final Image back;

  const FlipCard(
      {Key? key,
      required this.front,
      required this.back,
      required this.controller})
      : super(key: key);

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> with TickerProviderStateMixin {
  late AnimationController controller;
  Future flipCard() async {}

  @override
  void initState() {
    super.initState();
    widget.controller._state = this;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final angle = controller.value * -pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(angle);
          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: widget.front,
          );
        });
  }
}

class FlipCardController {
  _FlipCardState? _state;

  Future flipCard() async => _state?.flipCard();
}
