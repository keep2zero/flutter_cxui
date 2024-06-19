import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/popover/popover_arrow.dart';

void openPopover<T extends Object?>({
  required BuildContext target,
  bool isDirect = false,
  double offsetX = 20,
  List<Widget>? items,
}) {
  final RenderBox renderbox = target.findRenderObject() as RenderBox;

  //log("${target.size}， ${renderbox.localToGlobal(Offset.zero)}, ${renderbox.globalToLocal(Offset.zero)}");

  // contentmenu box
  final screenSize = MediaQuery.of(target).size;
  final screenHeight = screenSize.height;
  final width = screenSize.width - 80;

  //计算x, y
  final Offset offset = renderbox.localToGlobal(Offset.zero);
  double x = offset.dx;
  double y = offset.dy + renderbox.size.height;
  if (isDirect) {
    x = screenSize.width - (x + renderbox.size.width) - offsetX - 15;
    //y = off
  }

  double height = 80;
  double arrowHeight = 8;
  double arrowWidth = 10;

  //arrow
  double arrowX = x + arrowWidth;
  double arrowY = y;

  if (isDirect) {
    arrowX = offset.dx + renderbox.size.width - offsetX;
  }

  bool outBound = false;
  bool toTop = y + height > screenHeight - 64;

  // bool toBottom = renderbox.size.height + 64 > screenHeight;
  // log("the ${offset.dy}, $y, ${renderbox.size.height}, ${screenHeight} $toTop, $toBottom");

  if (toTop) {
    y = offset.dy - height - 18;
    arrowY = offset.dy - arrowWidth;

    //超出顶部
    if (y - height < 0) {
      y = (offset.dy + renderbox.size.height - height) / 2;
      arrowY = y + height + arrowHeight;
    }

    outBound = true;
  }
  // if (toTop && toBottom) {
  //   y = screenHeight / 2;
  // }

  Navigator.of(target, rootNavigator: true).push<T>(
    RawDialogRoute<T>(
      pageBuilder: (_, animation, __) {
        return PopScope(
          child: Popover(
            // contentW: renderbox.size.width,
            // contentH: renderbox.size.height,
            x: x,
            y: y,
            width: width,
            height: height,
            arrowX: arrowX,
            arrowY: arrowY,
            arrowWidth: 10,
            arrowHeight: arrowHeight,
            outBound: outBound,
            child: Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Row(
                children: items ?? [],
              ),
            ),
          ),
          onPopInvoked: (didPop) {
            log("the pop $didPop");
          },
        );
      },
      barrierDismissible: true,
      barrierLabel: "hello world",
      barrierColor: Colors.transparent,
      settings: const RouteSettings(),
    ),
  );
}

class Popover extends StatelessWidget {
  const Popover({
    super.key,
    this.child,
    this.x = 0,
    this.y = 0,
    this.width = 100,
    this.height = 20,
    this.arrowX = 0,
    this.arrowY = 0,
    this.arrowWidth = 10,
    this.arrowHeight = 8,
    this.outBound = false,
  });
  final Widget? child;
  final double x;
  final double y;
  final double width;
  final double height;

  final double arrowWidth;
  final double arrowHeight;
  final double arrowX;
  final double arrowY;

  final bool outBound;

  @override
  Widget build(BuildContext context) {
    // final lw = w / 2 - 26;
    // final lw = contentW / 2 - 4;

    // final mh = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Stack(
        children: [
          if (child != null) Positioned(left: x, top: y + 8, child: child!),
          Positioned(
            // left: 20,
            // top: y + height > mh ? y + height + 7 : y,
            left: arrowX,
            top: arrowY,
            child: ClipPath(
              clipper:
                  PopoverArrowClipper(position: outBound ? "bottom" : "top"),
              child: Container(
                width: arrowWidth,
                height: arrowHeight,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
