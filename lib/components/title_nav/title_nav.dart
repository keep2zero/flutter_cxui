import 'package:flutter/material.dart';

class CxTitleNav extends StatefulWidget {
  const CxTitleNav({
    super.key,
    required this.items,
    this.size,
    this.select,
    this.selectSize,
    this.color,
    this.selectColor,
  });

  @override
  State<CxTitleNav> createState() => _CxTitleNavState();

  final List<String> items;
  final double? size;
  final int? select;
  final double? selectSize;

  final Color? color;
  final Color? selectColor;
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
