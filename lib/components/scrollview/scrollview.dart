import 'package:flutter/material.dart';

enum CxScrollViewStatus { loading, complete }

class CxScrollView extends StatefulWidget {
  const CxScrollView({super.key, required this.child, required this.load});

  /// main container.
  final Widget child;

  final Function() load;

  @override
  State<CxScrollView> createState() => _CxScrollViewState();
}

class _CxScrollViewState extends State<CxScrollView> {
  CxScrollViewStatus status = CxScrollViewStatus.complete;
  @override
  void didUpdateWidget(covariant CxScrollView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("did update widget");
    status = CxScrollViewStatus.complete;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: widget.child,
      onNotification: (ScrollNotification notification) {
        // print(
        //     "hello ${notification.metrics.axis} : ${notification.metrics.maxScrollExtent} : ${notification.metrics.pixels}");
        if (notification is ScrollUpdateNotification) {
          final maxsc = notification.metrics.maxScrollExtent;
          final scpix = notification.metrics.pixels;

          if (maxsc > scpix && maxsc - scpix < 100) {
            toload();
          }
          return true;
        }

        if (notification is OverscrollNotification) {
          if (notification.overscroll > 0) {
            toload();
          }
          // print("overscrolling: ${notification.overscroll}");

          return true;
        }

        return false;
      },
    );
  }

  void toload() {
    if (status == CxScrollViewStatus.complete) {
      status = CxScrollViewStatus.loading;
      widget.load();
    }
  }
}
