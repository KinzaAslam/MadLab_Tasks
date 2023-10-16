import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Image Zoom In/Out"),
        ),
        body: const Center(
          child: ImageChange(),
        ),
      ),
    );
  }
}

class ImageChange extends StatefulWidget {
  const ImageChange({Key? key}) : super(key: key);

  @override
  ImageChangeState createState() => ImageChangeState();
}

class ImageChangeState extends State<ImageChange> {
  double scale = 1.0;
  double baseScale = 1.0;
  bool isFirstImage = true;

  void changeImage() {
    setState(() {
      isFirstImage = !isFirstImage;
    });
  }

  void onScaleStart(ScaleStartDetails details) {
    baseScale = scale;
  }

  void onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      scale = baseScale * details.scale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeImage,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      child: Transform.scale(
        scale: scale,
        child: SizedBox(
          width: 200,
          height: 200,
          child: isFirstImage
              ? Image.asset('assets/images/Cartoon.jpg')
              : Image.asset('assets/images/Lion.jpg'),
        ),
      ),
    );
  }
}
