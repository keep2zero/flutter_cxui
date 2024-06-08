import 'package:flutter/material.dart';

class ArrowClipper extends CustomClipper<Path> {
  const ArrowClipper({this.position = "left"});
  final String position;
  @override
  Path getClip(Size size) {
    // Define a custom path to create a stylish clipped shape
    var path = Path();
    // to top
    // path.moveTo(size.width * 0.5, 0);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);
    if (position == "left") {
      path.moveTo(0, size.height * 0.5);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.close();
    } else {
      path.moveTo(size.width, size.height * 0.5);
      path.lineTo(0, 0);
      path.lineTo(0, size.height);
      path.close();
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
