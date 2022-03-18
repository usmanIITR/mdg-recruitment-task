import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
class ImageSwapPage extends StatefulWidget {
  const ImageSwapPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ImageSwapPage> createState() => _ImageSwapPageState();
}

class _ImageSwapPageState extends State<ImageSwapPage> {
  AssetImage image1 = const AssetImage("assets/images/spadesHearts.jpg");
  AssetImage image2 = const AssetImage("assets/images/clubDiamond.jpg");
  ShakeDetector ?detector;
  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          AssetImage temp = image1;
          image1 = image2;
          image2 = temp;
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
            title: const Text("Image-Swap!"),
            centerTitle: true,
          ),
          body: Container(
              child: Column(
                  children: [
                    Flexible(
                      child: FractionallySizedBox(
                        heightFactor: 1, widthFactor: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.transparent,
                            backgroundImage: image1,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: FractionallySizedBox(
                        heightFactor: 1, widthFactor: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.transparent,
                            backgroundImage: image2,
                          ),
                        ),
                      ),
                    ),
                  ]
              )
          )
      );
}