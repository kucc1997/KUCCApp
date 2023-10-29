import 'package:flutter/material.dart';

const String imagePath = "assets/images/kucc_logo.png";

class Logo extends StatelessWidget {
  final double width, height;

  const Logo({Key? key, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(imagePath),
    );
  }
}
