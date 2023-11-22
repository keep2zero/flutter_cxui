import 'package:flutter/material.dart';

/// Image Card Component
/// The focus of the image card is the `img` address. address is local or network.
/// Additional properties are title, subtitle, topRight, topLeft, bottomRight, bottomLeft, cornerHeight or imgFix.
/// The topRight, topLeft, bottomRight and bottomLeft are in the Stack layout. Their type is [Widget].
///
/// the example below is that how to use it.
///
/// {@tool snippet}
/// ```dart
///   CxImageCard(
///     title: "Movie Name",
///     subtitle: "a good movie",
///     img: "https://example.com/images/example.jpg",
///     imgIsNet: true,
///   )
/// ```
/// {@end-tool}
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

  /// top left widget of the image card.
  final List<Widget>? topLeft;

  /// top right widget of the image card.
  final List<Widget>? topRight;

  /// bottom left widget of the image card.
  final List<Widget>? bottomLeft;

  /// bottom right widget of the image card.
  final List<Widget>? bottomRight;

  /// the title of the image card.
  final String? title;

  /// the image card's subtitle.
  final String? subtitle;

  /// the height of the four corners of image card. Default is `20`.
  final double? cornerHeight;

  /// url of the image.
  final String? img;

  /// Is this image address in network form. Default is `false`.
  final bool? imgIsNet;

  /// Image display mode. Default is `BoxFit.cover`.
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
            fontSize: 14,
          ),
        ),
      );
    }

    if (widget.subtitle != null) {
      children.add(
        Text(
          widget.subtitle!,
          style: TextStyle(
            fontSize: 10,
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
