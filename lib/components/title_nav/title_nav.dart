import 'package:flutter/material.dart';

/// Title Navigation
/// It likes component of the category list.
///
/// Usage:
///
/// {@tool snippet}
/// ```dart
///
///  CxTitleNav(
///    size: 12,
///    selectSize: 16,
///    color: Colors.primary,
///    selectColor: Colors.red,
///    items: const ["首页", "电视剧", "电影", "综艺", "动漫", "少儿", "体育", "纪录片"],
///  )
///
/// ```
/// {@end-tool}
class CxTitleNav extends StatefulWidget {
  const CxTitleNav({
    super.key,
    required this.items,
    this.size,
    this.select,
    this.selectSize,
    this.color,
    this.selectColor,
    this.onChange,
  });

  @override
  State<CxTitleNav> createState() => _CxTitleNavState();

  /// the data list of the component.
  final List<String> items;

  /// the font size of the normal items. Default is 14.
  final double? size;

  /// the index of the select item. Default is 0.
  final int? select;

  /// the font size of the select item. Default is 20.
  final double? selectSize;

  /// color of the normal items. Default is theme's hintColor.
  final Color? color;

  /// the color of the select item. Default is Colors.black87.
  final Color? selectColor;

  /// the change event.
  final void Function(int)? onChange;
}

class _CxTitleNavState extends State<CxTitleNav> {
  late int current = widget.select ?? 0;

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        shrinkWrap: true,
        itemBuilder: itemBuilder,
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    ThemeData theme = Theme.of(context);

    Color selectColor = widget.selectColor ?? Colors.black87;

    return GestureDetector(
      onTap: () {
        if (widget.onChange != null) widget.onChange!(index);
        setState(() {
          current = index;
        });
      },
      child: Container(
        //color: Colors.amber,
        margin: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.items[index],
              style: TextStyle(
                fontSize: (current == index)
                    ? (widget.selectSize ?? 20)
                    : widget.size ?? 14,
                color: (current == index)
                    ? selectColor
                    : widget.color ?? theme.hintColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: 20,
              height: 2,
              color: (current == index)
                  ? selectColor.withAlpha(100)
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
