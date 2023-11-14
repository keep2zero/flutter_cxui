import 'package:flutter/material.dart';

class CxImageCard extends StatefulWidget {
  const CxImageCard({
    super.key,
    this.title,
    this.subtitle,
    this.topRight,
    this.topLeft,
    this.bottomRight,
    this.bottomLeft,
    this.cornerHeight,
    required this.img,
    this.imgIsNet,
    this.imgFix,
  });

  @override
  State<CxImageCard> createState() => _CxImageCardState();
  final List<Widget>? topLeft;
  final List<Widget>? topRight;
  final List<Widget>? bottomLeft;
  final List<Widget>? bottomRight;
  final String? title;
  final String? subtitle;
  final double? cornerHeight;
  final String? img;
  final bool? imgIsNet;
  final BoxFit? imgFix;
}

class _CxImageCardState extends State<CxImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      // color: Colors.black,
      child: Stack(
        // fit: StackFit.expand,
        children: [
          buildMain(context),
        ],
      ),
    );
  }

  Widget buildCover() {
    ImageProvider<Object> img;
    if (widget.imgIsNet ?? false) {
      img = NetworkImage(widget.img ?? "");
    } else {
      img = AssetImage(widget.img ?? "");
    }

    return Expanded(
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            // padding: EdgeInsets.all(8),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                width: double.infinity,
                fit: widget.imgFix ?? BoxFit.cover,
                image: img,
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

  Column buildMain(BuildContext context) {
    ThemeData theme = Theme.of(context);

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
          style: TextStyle(
            fontSize: 14,
            color: theme.hintColor,
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
