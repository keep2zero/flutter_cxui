import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cxui/components/popover/popover_arrow.dart';

void openPopover<T extends Object?>({required BuildContext context}) {
  final RenderBox renderbox = context.findRenderObject() as RenderBox;

  log("${context.size}， ${renderbox.localToGlobal(Offset.zero)}, ${renderbox.globalToLocal(Offset.zero)}");
  final Offset offset = renderbox.localToGlobal(Offset.zero);

  final x = offset.dx;
  final y = offset.dy + renderbox.size.height;

  final width = MediaQuery.of(context).size.width - 80;

  Navigator.of(context, rootNavigator: true).push<T>(
    RawDialogRoute<T>(
      pageBuilder: (_, animation, __) {
        return PopScope(
          child: Popover(
            x: x,
            y: y,
            w: width,
            h: 80,
            child: Container(
              width: width,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
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
      settings: RouteSettings(),
    ),
  );
}

class Popover extends StatelessWidget {
  const Popover({super.key, this.child, this.x = 0, this.y = 0, this.w = 100, this.h = 20});
  final Widget? child;
  final double x;
  final double y;
  final double w;
  final double h;
  @override
  Widget build(BuildContext context) {
    final lw = w / 2 - 26;

    log("$w");

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Stack(
        children: [
          if (child != null) Positioned(left: x, top: y + 8, child: child!),
          Positioned(
            left: x + lw,
            top: y,
            child: ClipPath(
              clipper: const PopoverArrowClipper(),
              child: Container(
                width: 10,
                height: 8,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
