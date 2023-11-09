import 'package:flutter/material.dart';

class ImageCard extends StatefulWidget {
  ImageCard({
    super.key,
    this.title,
    this.subtitle,
    this.topRight,
    this.topLeft,
    this.bottomRight,
    this.bottomLeft,
    this.cornerHeight,
  });

  @override
  State<ImageCard> createState() => _ImageCardState();
  List<Widget>? topLeft;
  List<Widget>? topRight;
  List<Widget>? bottomLeft;
  List<Widget>? bottomRight;
  String? title;
  String? subtitle;
  double? cornerHeight;
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      // color: Colors.black,
      child: Stack(
        // fit: StackFit.expand,
        children: [
          buildMain(),
        ],
      ),
    );
  }

  Widget buildCover() {
    return Expanded(
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            // padding: EdgeInsets.all(8),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: const Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage("assets/img/card-img-01.jpg"),
              ),
            ),
          ),
          buildTopRight(),
          buildTopLeft(),
          buildBottomRight(),
          buildBottomLeft()
        ],
      ),
    );
  }

  Column buildMain() {
    final children = [buildCover()];
    if (widget.title != null || widget.subtitle != null) {
      children.add(
        const SizedBox(
          height: 8,
        ),
      );
    }

    if (widget.title != null) {
      children.add(
        Text(
          widget.title!,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      );
    }

    if (widget.subtitle != null) {
      children.add(
        Text(
          widget.subtitle!,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget buildRound(double? left, double? top, double? right, double? bottom,
      List<Widget> children) {
    return Positioned(
      right: right,
      top: top,
      left: left,
      bottom: bottom,
      child: Container(
          // color: Colors.green,
          height: widget.cornerHeight ?? 20,
          child: Row(
            children: children,
          )),
    );
  }

  Widget buildTopRight() {
    return buildRound(null, 0, 0, null, widget.topRight ?? []);
  }

  Widget buildTopLeft() {
    return buildRound(0, 0, null, null, widget.topLeft ?? []);
  }

  Widget buildBottomRight() {
    return buildRound(null, null, 0, 0, widget.bottomRight ?? []);
  }

  Widget buildBottomLeft() {
    return buildRound(0, null, null, 0, widget.bottomLeft ?? []);
  }
}
