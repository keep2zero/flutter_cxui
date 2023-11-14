import 'package:flutter/material.dart';

class CxTitleNav extends StatefulWidget {
  CxTitleNav({super.key, required this.items, this.select, this.selectSize});

  @override
  State<CxTitleNav> createState() => _CxTitleNavState();

  List<String> items;
  int? select;
  double? selectSize;
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
    return GestureDetector(
      onTap: () {
        setState(() {
          current = index;
        });
      },
      child: Container(
        //color: Colors.amber,
        margin: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.items[index],
              style: TextStyle(
                fontSize: (current == index) ? (widget.selectSize ?? 20) : 14,
                color: (current == index)
                    ? Theme.of(context).cardTheme.color
                    : theme.hintColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: 20,
              height: 2,
              color: (current == index) ? theme.focusColor : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
