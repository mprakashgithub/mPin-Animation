import 'package:flutter/material.dart';
import 'package:m_pin/widgets/ok1.dart';
import 'mpin/mpin_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ExplicitAnimationExample(),
    );
  }
}
