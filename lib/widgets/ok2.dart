import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "m-Pin",
      home: Scaffold(
        appBar: AppBar(title: const Text('3 D')),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _rotateAanimation;
  Animation<double>? _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    )..forward();

    _rotateAanimation = Tween<double>(begin: 0.0, end: 6.0 * math.pi)
        .chain(CurveTween(curve: Curves.easeOutQuart))
        .animate(_controller!);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 2.0)
        .chain(CurveTween(curve: Curves.easeOutQuart))
        .animate(_controller!);
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller!,
        builder: (BuildContext? context, Widget? child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(_rotateAanimation!.value)
              ..scale(_scaleAnimation!.value),
            // child: FlutterLogo(size: 150.0),
            child: Image.asset("assets/front.png"),
          );
        });
  }
}
