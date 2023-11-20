import 'package:flutter/material.dart';

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

  final List<PlaceGridItem>? items;
  final int? cols;
  final double? space;
  final double? height;
  final double? ratio;
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

class PlaceGridItem {
  IconData? icon;
  String? title;
  double? titleSize;
  Color? color;
  Color? iconColor;
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