import 'package:flutter/material.dart';

/// Select Button List
/// It likes that select item of the video play list in the video play page of tencent video website.
/// the data and onChange of the component are required properties.
/// the type of `data` is [List]. the subtype of [List] is [String].
/// the `onChange` is event. the event can be called after the data item widget is clicked.
///
/// three types of parameters of the component. they are box, item and action.
/// the box: size, boxColor, margin, padding.
/// the item:  fontSize, color, selectColor, bgColor, selectBgColor, defaultSelect, minWidth
/// the action: hasTopRight, topRight.
///
///
///{@tool snippet}
///
/// ```dart
///   CxSelectButtonList(
///      boxColor: Colors.transparent,
///      bgColor: Colors.primary.withAlpha(200),
///      selectBgColor: Colors.primary,
///      size: 50,
///      data: const <String>["1", "2", "3", "4", "5", "6", "7", "8", "9"],
///      onChange: (index, item) {
///        // print("$index $item");
///      },
///    );
/// ```
///
/// {@end-tool}
class CxSelectButtonList extends StatefulWidget {
  const CxSelectButtonList({
    super.key,
    required this.data,
    required this.onChange,
    this.size,
    this.boxColor = Colors.transparent,
    this.margin,
    this.padding,
    this.fontSize,
    this.color = Colors.white,
    this.selectColor = Colors.white,
    this.bgColor = Colors.blue,
    this.selectBgColor = Colors.green,
    this.defaultSelect = 0,
    this.minWidth,
    this.hasTopRight,
    this.topRight,
  });

  /// the data list to show.
  final List<String> data;

  /// height of the component. Default is `60`.
  final double? size;

  /// the component background color.
  final Color? boxColor;

  /// the component padding.
  final EdgeInsetsGeometry? padding;

  /// the component margin.
  final EdgeInsetsGeometry? margin;

  /// the font size of the items. Default is `14`.
  final double? fontSize;

  /// the min width of the items. Default is `50`.
  final double? minWidth;

  /// the font color of the items.
  final Color? color;

  /// the font color of the select item.
  final Color? selectColor;

  /// the background color of the items
  final Color? bgColor;

  ///the background color of the select item.
  final Color? selectBgColor;

  /// default select index. Default is `0`.
  final int? defaultSelect;

  /// top right widget.
  final Widget? topRight;

  /// are top right widgets show?
  /// the item is index of the data. default is `false`.
  final List<int>? hasTopRight;

  /// the select index is changed to response.
  final Function onChange;
  @override
  State<CxSelectButtonList> createState() => _CxSelectButtonListState();
}

class _CxSelectButtonListState extends State<CxSelectButtonList> {
  late int selectIndex = widget.defaultSelect ?? 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size ?? 60,
      color: widget.boxColor,
      child: ListView.builder(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
        itemCount: widget.data.length,
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    final stack = Stack(
      children: [
        GestureDetector(
          onTap: () {
            widget.onChange(index, widget.data.elementAt(index));
            setState(() {
              selectIndex = index;
            });
          },
          child: Stack(
            children: [
              Container(
                constraints: BoxConstraints(minWidth: widget.minWidth ?? 50),
                decoration: BoxDecoration(
                  color: selectIndex == index
                      ? widget.selectBgColor
                      : widget.bgColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                padding: widget.padding ??
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                margin: widget.margin ?? const EdgeInsets.all(8),
                width: widget.size,
                child: Center(
                  child: Text(
                    widget.data[index],
                    style: TextStyle(
                      fontSize: widget.fontSize ?? 14,
                      color: selectIndex == index
                          ? widget.selectColor
                          : widget.color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    if (widget.topRight != null &&
        widget.hasTopRight != null &&
        widget.hasTopRight!.contains(index)) {
      stack.children.add(
        Positioned(
          right: 0,
          top: 0,
          child: widget.topRight!,
        ),
      );
    }

    return stack;
  }
}
