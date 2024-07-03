import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatFileType extends StatelessWidget {
  const ChatFileType({
    super.key,
    this.type = "",
    this.color = Colors.red,
  });
  final String type;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ChatFileTypePath(),
      child: Container(
        width: 30,
        height: 40,
        decoration: BoxDecoration(color: color),
        child: Stack(
          children: [
            Center(
              child: Text(
                type,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned.fill(
              child: ClipPath(
                clipper: ChatFileTypePathCorner(),
                child: Container(
                    color: Color.fromARGB(255, color.red - 20, color.green - 20,
                        color.blue - 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatFileTypePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    log("$size");
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width - 10, 0);
    path.lineTo(size.width, 10);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ChatFileTypePathCorner extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    log("$size");
    var path = Path();

    path.moveTo(size.width - 10, 0);
    path.lineTo(size.width, 10);
    path.lineTo(size.width - 10, 10);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
