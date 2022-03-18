import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:shake_it_up/screens/color_swap_page.dart';

import 'image_swap_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
        title: const Text("Swap-On-Shake App!"),
        centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(10.0)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ColorSwapPage(title: "Color-Swap Page")));
                },
                child: const Text("Color-Swap Page"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(10.0)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageSwapPage(title: "Image-Swap Page")));
                },
                child: const Text("Image-Swap Page"),
              ),
            ],
          ),
        )
      );
}