import 'package:flutter/material.dart';

class CxLoading extends StatefulWidget {
  const CxLoading({super.key});

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
      duration: const Duration(milliseconds: 1500),
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
        color: Colors.white.withAlpha(160),
        size: 40,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
