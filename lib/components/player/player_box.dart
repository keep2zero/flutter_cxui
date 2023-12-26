import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerBox extends StatefulWidget {
  const PlayerBox({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
  });
  final VideoPlayerController controller;
  final double width;
  final double height;
  @override
  State<PlayerBox> createState() => _PlayerBoxState();
}

class _PlayerBoxState extends State<PlayerBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.black,
      child: VideoPlayer(widget.controller),
    );
  }
}
