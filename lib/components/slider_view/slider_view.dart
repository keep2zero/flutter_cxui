import 'dart:async';

import 'package:flutter/material.dart';

class SliderObject {
  String objName;
  String objCover;
  SliderObject(this.objName, this.objCover);
}

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

  final List<SliderObject> objects;
  final void Function(SliderObject, int)? onTap;
  final double? height;
  final Color? titleColor;
  final double? titleSize;
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
                    buildTitle(),
                    buildDot(),
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

  Widget itemSliderImage(BuildContext context, int ix) {
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
          fit: BoxFit.fitWidth,
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
