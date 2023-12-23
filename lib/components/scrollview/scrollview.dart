import 'dart:async';

import 'package:flutter/material.dart';

enum CxScrollViewStatus { loading, complete }

class CxScrollView extends StatefulWidget {
  const CxScrollView({
    super.key,
    required this.child,
    required this.onLoad,
    this.timeout = 20,
    this.loadingText = "Loading...",
    this.loadingWidget,
    this.onTimeout,
    this.isLoadingIcon = true,
  });

  /// main container.
  final Widget child;

  /// loading widget. If it is be setting, default widget can be replaced.
  final Widget? loadingWidget;

  /// timeout for loading more. default value is 20s.
  final int timeout;

  /// timeout callback.
  final Function? onTimeout;

  final bool isLoadingIcon;
  //loading text. default value is "Loading..."
  final String loadingText;

  final Function() onLoad;

  @override
  State<CxScrollView> createState() => _CxScrollViewState();
}

class _CxScrollViewState extends State<CxScrollView>
    with SingleTickerProviderStateMixin {
  CxScrollViewStatus status = CxScrollViewStatus.complete;
  Timer? timer;
  late AnimationController atControll;

  @override
  void didUpdateWidget(covariant CxScrollView oldWidget) {
    timer?.cancel();
    setState(() {
      status = CxScrollViewStatus.complete;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    atControll = AnimationController(
        vsync: this, duration: Duration(seconds: widget.timeout))
      ..repeat();

    super.initState();
  }

  Widget loadingTextWidget() {
    return Container(
      color: Colors.grey[200],
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.loadingText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black.withAlpha(160),
          fontSize: 14,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget loadingIconWidget() {
    return AnimatedBuilder(
      animation: atControll,
      builder: (BuildContext context, Widget? panel) {
        return Transform.rotate(
          angle: atControll.value * 20,
          child: panel,
        );
      },
      child: Icon(
        Icons.rotate_right,
        size: 30,
        color: Colors.white.withAlpha(200),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: Column(
        children: [
          Expanded(child: widget.child),
          if (status == CxScrollViewStatus.loading)
            widget.loadingWidget != null
                ? widget.loadingWidget!
                : (widget.isLoadingIcon
                    ? loadingIconWidget()
                    : loadingTextWidget()),
        ],
      ),
      onNotification: (ScrollNotification notification) {
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

          return true;
        }

        return false;
      },
    );
  }

  void toload() {
    if (status == CxScrollViewStatus.complete) {
      scheduleTimeout();
      setState(() {
        status = CxScrollViewStatus.loading;
      });
      widget.onLoad();
    }
  }

  void scheduleTimeout() {
    timer = Timer(Duration(seconds: widget.timeout), () {
      if (widget.onTimeout != null) widget.onTimeout!();
      setState(() {
        status = CxScrollViewStatus.complete;
      });
    });
  }
}
