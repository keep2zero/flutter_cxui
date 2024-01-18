// import 'package:fijkplayer/fijkplayer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/loading/loading.dart';

import 'package:flutter_cxui/components/player/player_box.dart';
import 'package:flutter_cxui/components/player/player_control.dart';
import 'package:flutter_cxui/components/player/player_handle.dart';

// todo
// timeRatio: follow screen width;

class CxPlayer extends StatefulWidget {
  const CxPlayer({
    super.key,
    this.width,
    this.height,
    this.onFullScreen,
    required this.url,
    required this.handler,
  });
  final double? width;
  final Function(bool)? onFullScreen;
  final String url;
  final PlayerHandler handler;
  final double? height;
  @override
  State<CxPlayer> createState() => _CxPlayerState();
}

class _CxPlayerState extends State<CxPlayer>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  bool isPlayed = false;
  bool loading = false;
  double? progressValue = 0; //play progress

  int seconds = 0; //总时间
  int seconding = 0; //当前时间
  double timeRatio = 1;
  double ratio = 9 / 16;

  bool isFull = false;
  bool isShow = true;

  double height = 0;

  ///用来计算拖动时间的字段
  double of_start = 0;
  double of_end = 0;
  String of_sec = "00:00";

  ///

  // late VideoPlayerController controller;
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

  int drag2sec() {
    final box = MediaQuery.of(context);
    double width = box.size.width;
    return ((of_end - of_start) / width * 100).toInt();
  }

  String dragSecStr(int secs) {
    final m = (secs.abs() / 60).floor().toString().padLeft(2, '0');
    final s = (secs.abs() % 60).toString().padLeft(2, '0');
    String res = "$m:$s";

    if (secs < 0) {
      res = "-$res";
    }

    return res;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    widget.handler.addCreate((controller) {
      setState(() {
        seconds = 0;
        seconding = 0;
        of_sec = "00:00";
        of_start = 0;
        of_end = 0;

        isPlayed = false;
        progressValue = 0;
        loading = true;
      });
    });

    widget.handler.addListener((controller) {
      final pos = controller.value.position;
      // print("hello: ${pos.inSeconds} ${ratio} ${width}");
      setState(() {
        seconding = pos.inSeconds;
        progressValue = timeRatio * seconding;
      });
    });

    widget.handler.addComplete((controller, p0) {
      final value = controller.value;
      print("the ratio: ${value.size} ${value.size.width / value.size.height}");
      setState(() {
        loading = false;
        seconds = value.duration.inSeconds;
        // print(seconds);
        timeRatio =
            (widget.width ?? MediaQuery.of(context).size.width) / seconds;
        ratio = value.size.height / value.size.width;
      });
    });

    // controller = VideoPlayerController.networkUrl(Uri.parse(widget.url));

    //total of the seconds.
    //video ratio.
    // time ratio.
    // controller.initialize().then((v) {});

    //calc play progress.

    super.initState();
  }

  void fullscreenListener() {
    Future.delayed(const Duration(milliseconds: 100), () {
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
        height: widget.height,
        width: double.infinity,
        color: Colors.black,
        child: Stack(
          children: [
            // Positioned.fill(
            Center(
              child: PlayerBox(
                controller: widget.handler,
                width: width,
                height: height,
              ),
            ),
            // ),
            Positioned.fill(
              child: GestureDetector(
                onHorizontalDragStart: (detail) {
                  of_start = detail.localPosition.dx;
                },
                onHorizontalDragUpdate: (detail) {
                  if (of_start > 0) {
                    of_end = detail.localPosition.dx;
                    setState(() {
                      of_sec = dragSecStr(drag2sec());
                    });
                  }
                },
                onHorizontalDragEnd: (detail) {
                  final ofOk = drag2sec();
                  widget.handler.seekTo(Duration(seconds: seconding + ofOk));

                  of_start = 0;
                  of_sec = "00:00";
                },
                onDoubleTapDown: (TapDownDetails detail) {
                  print("double click ${detail.localPosition}");
                  final Offset offset = detail.localPosition;
                  final width = MediaQuery.of(context).size.width / 2;
                  if (offset.dx < width) {
                    if (seconding > 10) {
                      widget.handler.seekTo(Duration(seconds: seconding - 10));
                    }
                  } else {
                    widget.handler.seekTo(Duration(seconds: seconding + 10));
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
                  played: isPlayed,
                  seconds: seconds,
                  seconding: seconding,
                  controller: widget.handler,
                  progress: progressValue ?? 0,
                  isFull: isFull,
                  ratio: timeRatio,
                  isShow: isShow,
                  onPlayed: (played) {
                    setState(() {
                      isPlayed = played;
                    });
                  },
                ),
              ),
            ),
            if (of_sec != "00:00")
              Positioned.fill(
                child: IgnorePointer(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black45,
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(100),
                        ),
                        child: Text(
                          "$of_sec",
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ///////
            ///
            if (loading)
              Positioned.fill(
                child: CxLoading(),
              )

            ///
            ///
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // widget.handler.dispose();
    WidgetsBinding.instance.removeObserver(this);
    // player.dispose();
    super.dispose();
  }
}
