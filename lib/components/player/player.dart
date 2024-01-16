// import 'package:fijkplayer/fijkplayer.dart';

import 'package:flutter/material.dart';

import 'package:flutter_cxui/components/player/player_box.dart';
import 'package:flutter_cxui/components/player/player_control.dart';
import 'package:flutter_cxui/cxui.dart';
import 'package:video_player/video_player.dart';

// todo
// timeRatio: follow screen width;

class CxPlayer extends StatefulWidget {
  const CxPlayer({super.key, this.width, this.onFullScreen, required this.url});
  final double? width;
  final Function(bool)? onFullScreen;
  final String url;
  @override
  State<CxPlayer> createState() => _CxPlayerState();
}

class _CxPlayerState extends State<CxPlayer> with WidgetsBindingObserver {
  bool isPlayed = false;
  double? progressValue = 0; //play progress

  int seconds = 0; //总时间
  int seconding = 0; //当前时间
  double timeRatio = 1;
  double ratio = 9 / 16;

  bool isFull = false;
  bool isShow = true;

  double height = 0;

  late VideoPlayerController controller;
  // VideoPlayerController controller = VideoPlayerController.networkUrl(Uri.parse(
  //     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
  // VideoPlayerController? controller;
  // final FijkPlayer player = FijkPlayer();
  // Create a [Player] to control playback.
  // late final player = Player();
  // Create a [VideoController] to handle video output from [Player].
  // late final controller = VideoController(player);

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    fullscreenListener();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    controller = VideoPlayerController.networkUrl(Uri.parse(widget.url));

    //total of the seconds.
    //video ratio.
    // time ratio.
    controller.initialize().then((v) {
      controller.addListener(() {
        final pos = controller.value.position;
        // print("hello: ${pos.inSeconds} ${ratio} ${width}");
        setState(() {
          seconding = pos.inSeconds;
          progressValue = timeRatio * seconding;
        });
      });

      final value = controller.value;
      print("the ratio: ${value.size} ${value.size.width / value.size.height}");
      setState(() {
        seconds = value.duration.inSeconds;
        // print(seconds);
        timeRatio =
            (widget.width ?? MediaQuery.of(context).size.width) / seconds;
        ratio = value.size.height / value.size.width;
      });
    });

    //calc play progress.

    super.initState();
  }

  void fullscreenListener() {
    Future.delayed(Duration(milliseconds: 100), () {
      Orientation direct = MediaQuery.of(context).orientation;
      print("fullscreen: ${direct}");
      if (direct == Orientation.landscape) {
        if (widget.onFullScreen != null) {
          widget.onFullScreen!(true);
        }
        setState(() {
          isFull = true;
        });
      } else {
        if (widget.onFullScreen != null) {
          widget.onFullScreen!(false);
        }
        setState(() {
          isFull = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final box = MediaQuery.of(context);
    double width = box.size.width;

    timeRatio = width / seconds;
    height = width * ratio;
    if (height > box.size.height) {
      height = box.size.height;
      width = height / ratio;
    }

    return Center(
      child: Container(
        height: height,
        width: double.infinity,
        color: Colors.black,
        child: Stack(
          children: [
            // Positioned.fill(
            Center(
              child: PlayerBox(
                controller: controller,
                width: width,
                height: height,
              ),
            ),
            // ),
            Positioned.fill(
              child: GestureDetector(
                onHorizontalDragUpdate: (detail) {},
                onHorizontalDragEnd: (detail) {},
                onDoubleTapDown: (TapDownDetails detail) {
                  print("double click ${detail.localPosition}");
                  final Offset offset = detail.localPosition;
                  final width = MediaQuery.of(context).size.width / 2;
                  if (offset.dx < width) {
                    if (seconding > 10) {
                      controller.seekTo(Duration(seconds: seconding - 10));
                    }
                  } else {
                    controller.seekTo(Duration(seconds: seconding + 10));
                  }
                },
                onTap: () {
                  print("object");
                  setState(() {
                    isShow = !isShow;
                  });
                },
                behavior: HitTestBehavior.translucent,
                child: PlayerControl(
                  seconds: seconds,
                  seconding: seconding,
                  controller: controller,
                  progress: progressValue ?? 0,
                  isFull: isFull,
                  ratio: timeRatio,
                  isShow: isShow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    // player.dispose();
    super.dispose();
  }
}
