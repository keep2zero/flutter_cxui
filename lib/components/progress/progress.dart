import 'package:flutter/material.dart';

class CxProgress extends StatefulWidget {
  const CxProgress(
      {super.key,
      this.progress = 0,
      this.onProgress,
      this.width,
      this.height,
      this.range});
  final double? progress;
  final Function(double)? onProgress;
  final double? width;
  final double? height;

  /// range -> control area
  final double? range;
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
        color: Colors.transparent,
        padding: EdgeInsets.only(top: widget.range ?? 0),
        child: SizedBox(
          height: widget.height ?? 10,
          child: Stack(
            children: [
              Container(
                color: Colors.grey.withAlpha(100),
              ),
              Container(
                width: (widget.progress!.isNaN) ? 0 : widget.progress,
                color: Colors.purple.withAlpha(100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
