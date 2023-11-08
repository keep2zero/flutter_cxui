import 'package:flutter/material.dart';

class SelectButtonList extends StatefulWidget {
  SelectButtonList({
    super.key,
    required this.data,
    required this.onChange,
    this.size,
    this.boxColor = Colors.black,
    this.color = Colors.white,
    this.bgColor = Colors.white38,
    this.selectColor = Colors.white,
    this.selectBgColor = Colors.green,
    this.defaultSelect = 0,
  });

  //数据
  List<String> data;

  Function onChange;
  double? size;
  Color? color;
  Color? selectColor;
  Color? bgColor;
  Color? selectBgColor;
  Color? boxColor;
  int? defaultSelect;

  @override
  State<SelectButtonList> createState() => _SelectButtonListState();
}

class _SelectButtonListState extends State<SelectButtonList> {
  late int selectIndex = widget.defaultSelect ?? 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size ?? 60,
      color: widget.boxColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
        itemCount: widget.data.length,
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index, widget.data.elementAt(index));
        setState(() {
          selectIndex = index;
        });
      },
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: selectIndex == index ? widget.selectBgColor : widget.bgColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          margin: const EdgeInsets.all(8),
          width: widget.size ?? 50,
          child: Center(
              child: Text(
            widget.data[index],
            style: TextStyle(
              color: selectIndex == index ? widget.selectColor : widget.color,
            ),
          )),
        ),
      ]),
    );
  }
}
