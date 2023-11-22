import 'package:flutter/material.dart';

/// Place Grid Component.
///
/// {@tool snippet}
/// ```dart
/// CxPlaceGrid(
///   items: [
///     PlaceGridItem(icon:Icons.home, title: "Home")
///   ],
///   cols: 1,
///   space: 10,
///   height: 60,
/// )
/// ```
/// {@end-tool}
///
/// the data of gird item. See [PlaceGridItem].
///
class CxPlaceGrid extends StatefulWidget {
  const CxPlaceGrid({
    super.key,
    this.items,
    this.cols,
    this.space,
    this.height,
    this.ratio,
    this.bgColor,
  });

  @override
  State<CxPlaceGrid> createState() => _CxPlaceGridState();

  /// data of the component. It's a [List<PlaceGridItem>] object.
  final List<PlaceGridItem>? items;

  /// show several columns. default is `1`.
  final int? cols;

  /// the space between each item. default is `8`.
  final double? space;

  /// height of the component. default is `80`.
  final double? height;

  /// aspect ratio of the image. default is `1`.
  final double? ratio;

  /// background color of the component. default is `transparent`.
  final Color? bgColor;
}

class _CxPlaceGridState extends State<CxPlaceGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor ?? Colors.transparent,
      height: widget.height ?? 80,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.cols ?? 1,
          crossAxisSpacing: widget.space ?? 8,
          mainAxisSpacing: widget.space ?? 8,
          childAspectRatio: widget.ratio ?? 1,
        ),
        children: buildChild(context),
      ),
    );
  }

  List<Widget> buildChild(BuildContext context) {
    ThemeData theme = Theme.of(context);

    if (widget.items != null) {
      List<Widget> widgets = [];

      for (var i = 0; i < widget.items!.length; i++) {
        final item = widget.items!.elementAt(i);
        widgets.add(
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: item.iconColor ?? item.color ?? theme.cardTheme.color,
                  size: item.iconSize ?? 16,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  item.title ?? "",
                  // maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: item.titleSize ?? 10,
                    color: item.color ?? theme.cardTheme.color,
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return widgets;
    }
    return [];
  }
}

/// item data of the Place Grid Component
///
/// ```dart
/// PlaceGridItem(
///   title: "item"
///   icon: Icons.home,
/// )
/// ```
class PlaceGridItem {
  /// icon data can be [Icons] or other icon libaries.
  IconData? icon;

  /// title of the item.
  String? title;

  /// title size.
  double? titleSize;

  /// color of the title.
  Color? color;

  /// color of the icon.
  Color? iconColor;

  /// size of the icon.
  double? iconSize;

  PlaceGridItem({
    this.icon,
    this.title,
    this.titleSize,
    this.color,
    this.iconSize,
    this.iconColor,
  });
}
