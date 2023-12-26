import 'package:flutter/material.dart';

class CxProgress extends StatefulWidget {
  const CxProgress({super.key, this.progress = 0, this.onProgress});
  final double? progress;
  final Function(double)? onProgress;
  @override
  State<CxProgress> createState() => _CxProgressState();
}

class _CxProgressState extends State<CxProgress> {
  @override
  Widget build(BuildContext context) {
    // print("the size: ${widget.progress!.isNaN}");
    return GestureDetector(
      onTapUp: (TapUpDetails detail) {
        print("detail: ${detail.localPosition}");
        if (widget.onProgress != null) {
          widget.onProgress!(detail.localPosition.dx);
        }
      },
      child: Container(
        height: 10,
        child: Stack(
          children: [
            Container(
              color: Colors.grey.withAlpha(100),
            ),
            Container(
              width: (widget.progress!.isNaN) ? 0 : widget.progress,
              color: Colors.red.withAlpha(160),
            ),
          ],
        ),
      ),
    );
  }
}