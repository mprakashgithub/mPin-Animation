import 'package:flutter/material.dart';
import 'package:m_pin/widgets/flip_card_widget.dart';

class PCardPage extends StatefulWidget {
  const PCardPage({Key? key}) : super(key: key);

  @override
  State<PCardPage> createState() => _PCardPageState();
}

class _PCardPageState extends State<PCardPage> {
  final controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            FlipCard(
              front: Image.asset("assets/front.png"),
              back: Image.asset("assets/back.png"),
              controller: controller,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.flipCard();
                },
                child: Text("Flip"))
          ],
        ),
      ),
    );
  }
}
