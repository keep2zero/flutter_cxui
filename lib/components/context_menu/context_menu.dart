import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:popover/popover.dart';

class CxContextMenu<T> extends StatefulWidget {
  const CxContextMenu({super.key, this.child, this.itemBuilder});

  final Widget? child;

  final List<PopupMenuEntry<T>> Function(BuildContext)? itemBuilder;

  @override
  State<CxContextMenu> createState() => _CxContextMenuState();
}

class _CxContextMenuState extends State<CxContextMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        enableFeedback: true,
        canRequestFocus: true,
        onLongPress: () {
          // log("the show..................");
          // List<PopupMenuEntry> items = widget.itemBuilder!(context);
          // final RenderBox box = context.findRenderObject() as RenderBox;
          // final RenderBox overlay = Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;
          // const x = 10.0;
          // const y = 10.0;
          // final position = RelativeRect.fromRect(Rect.fromPoints(box.localToGlobal(const Offset(x, y)), box.localToGlobal(const Offset(x, y))), Offset.zero & overlay.size);
          // showMenu(context: context, position: position, items: items).then((value) {}).whenComplete(() {}).catchError((err) {});
        },
        child: widget.child,
      ),
    );
  }
}
