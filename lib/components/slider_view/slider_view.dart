import 'dart:async';

import 'package:flutter/material.dart';

/// Slider View Component.
///
/// It's very simple in its current state.
///
///{@tool snippet}
///
///Usage:
///
/// ```dart
/// CxSliderView(
///   height: 150,
///   onTap: (SliderObject obj, int index) {
///     // print("click the item $index");
///   },
///   objects: [
///     SliderObject("海豹看看",
///         "https://puui.qpic.cn/vcover_hz_pic/0/mzc00200q7mndle1664438925875/332?max_age=7776001"),
///     SliderObject("故宫里的大怪兽之莫奈何的谜题",
///         "https://puui.qpic.cn/vcover_hz_pic/0/mzc00200ap8s2p31697455490020/332?max_age=7776001"),
///     SliderObject("小不点.....",
///         "https://puui.qpic.cn/vpic_cover/m0038bibwlq/m0038bibwlq_hz.jpg/640"),
///   ],
/// )
///
/// ```
///
///{@end-tool}
///
///See more:
/// [SliderObject] is the item of the list.
///
class CxSliderView extends StatefulWidget {
  const CxSliderView({
    super.key,
    required this.objects,
    this.onTap,
    this.height,
    this.titleSize,
    this.titleColor,
  });

  @override
  State<CxSliderView> createState() => _SliderViewState();

  // the data list of the slider view.
  final List<SliderObject> objects;

  // the slider view's height. Default is `180`.
  final double? height;

  /// the color of title. Default is `Colors.white`.
  final Color? titleColor;

  /// the size of title. Default is `12`.
  final double? titleSize;

  /// the click event of the component.
  final void Function(SliderObject, int)? onTap;
}

class _SliderViewState extends State<CxSliderView> {
  int index = 0;
  bool isdrag = false;
  double dragstart = 0;
  double dragdistance = 0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = startTimer();
  }

  Timer startTimer() {
    return Timer.periodic(const Duration(seconds: 5), (timer) {
      if (index >= widget.objects.length - 1) {
        setState(() {
          index = 0;
        });
      } else {
        setState(() {
          index++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 180,
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onHorizontalDragStart: (DragStartDetails details) {
                  dragstart = details.localPosition.dx;
                  timer.cancel();
                },
                onHorizontalDragEnd: (DragEndDetails details) {
                  timer = startTimer();
                  if (dragdistance.abs() > 60) {
                    if (dragdistance < 0) {
                      if (index >= widget.objects.length - 1) {
                        index = -1;
                      }
                      setState(() {
                        index++;
                      });
                    }
                    if (dragdistance > 0) {
                      if (index <= 0) index = widget.objects.length;
                      setState(() {
                        index--;
                      });
                    }
                  }
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  //print("drag..............");
                  dragdistance = details.localPosition.dx - dragstart;
                },
                child: itemSliderImage(context, index),
              ),
            ),
          ),
          Positioned.fill(
            left: 8,
            right: 8,
            bottom: 8,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.objects.isNotEmpty) buildTitle(),
                    if (widget.objects.isNotEmpty) buildDot(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot() {
    return Container(
      //color: Colors.white,
      // height: 20,
      child: Builder(builder: (context) {
        List<Widget> children = [];
        for (int i = 0; i < widget.objects.length; i++) {
          children.add(
            GestureDetector(
              onTap: () {
                setState(() {
                  index = i;
                });
              },
              child: Container(
                width: 6,
                height: 6,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                decoration: BoxDecoration(
                  color: index == i ? Colors.white : Colors.white54,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        );
      }),
    );
  }

  Widget? itemSliderImage(BuildContext context, int ix) {
    if (widget.objects.isEmpty) return null;
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) widget.onTap!(widget.objects[ix], ix);
      },
      child: Container(
        // height: 180,

        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.network(
          widget.objects[ix].objCover,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      widget.objects[index].objName,
      style: TextStyle(
        fontSize: widget.titleSize ?? 12,
        color: widget.titleColor ?? Colors.white,
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();

    timer.cancel();
  }
}

/// the item object of the Slider View Component.
class SliderObject {
  /// the item's name.
  String objName;

  /// the item's image.
  String objCover;
  SliderObject(this.objName, this.objCover);
}
