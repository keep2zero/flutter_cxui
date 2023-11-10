import 'package:flutter/material.dart';

class CxPlaceGrid extends StatefulWidget {
  CxPlaceGrid(
      {super.key, this.items, this.cols, this.space, this.height, this.ratio});

  @override
  State<CxPlaceGrid> createState() => _CxPlaceGridState();

  List<PlaceGridItem>? items;
  int? cols;
  double? space;
  double? height;
  double? ratio;
}

class _CxPlaceGridState extends State<CxPlaceGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: item.color ?? Colors.black,
                  size: item.iconSize ?? 16,
                ),
                Text(
                  item.title ?? "",
                  style: TextStyle(
                    fontSize: item.titleSize ?? 12,
                    color: item.color ?? Colors.black,
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
  double? iconSize;
  PlaceGridItem(
      {this.icon, this.title, this.titleSize, this.color, this.iconSize});
}
