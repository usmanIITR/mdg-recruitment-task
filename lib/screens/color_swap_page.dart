import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
class ColorSwapPage extends StatefulWidget {
  const ColorSwapPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ColorSwapPage> createState() => _ColorSwapPageState();
}

class _ColorSwapPageState extends State<ColorSwapPage> {
  Color color1 = Colors.red;
  Color color2 = Colors.green;
  ShakeDetector ?detector;
  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          Color temp = color1;
          color1 = color2;
          color2 = temp;
        });
      },
    );
  }
  @override
  void dispose() {
    detector?.stopListening();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: AppBar(
            title: const Text("Color-Swap App!"),
            centerTitle: true,
          ),
          body: Container(
              child: Row(
                  children: [
                    Flexible(
                      child: FractionallySizedBox(
                        heightFactor: 1, widthFactor: 1,
                        child: Container(
                          color: color1,
                        ),
                      ),
                    ),
                    Flexible(
                      child: FractionallySizedBox(
                        heightFactor: 1, widthFactor: 1,
                        child: Container(
                          color: color2,
                        ),
                      ),
                    ),
                  ]
              )
          )
      );
}