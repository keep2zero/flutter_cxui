import 'package:flutter/material.dart';

class CxSelectButtonList extends StatefulWidget {
  const CxSelectButtonList({
    super.key,
    required this.data,
    required this.onChange,
    this.size,
    this.fontSize,
    this.boxColor = Colors.transparent,
    this.color = Colors.white,
    this.bgColor = Colors.blue,
    this.selectColor = Colors.white,
    this.selectBgColor = Colors.green,
    this.defaultSelect = 0,
    this.topRight,
    this.hasTopRight,
    this.margin,
    this.padding,
    this.minWidth,
  });

  //数据
  final List<String> data;

  final Function onChange;
  final double? fontSize;
  final double? size;
  final double? minWidth;
  final Color? color;
  final Color? selectColor;
  final Color? bgColor;
  final Color? selectBgColor;
  final Color? boxColor;
  final int? defaultSelect;
  final Widget? topRight;
  final List<int>? hasTopRight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

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
