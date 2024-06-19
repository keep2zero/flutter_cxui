import 'package:flutter/material.dart';

class CxLoading extends StatefulWidget {
  const CxLoading({super.key, this.color = Colors.white, this.size = 40});
  final Color color;
  final double size;
  @override
  State<CxLoading> createState() => _CxLoadingState();
}

class _CxLoadingState extends State<CxLoading> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _animation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    controller.repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Icon(
        Icons.refresh_outlined,
        color: widget.color,
        size: widget.size,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
