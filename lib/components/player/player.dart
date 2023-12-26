// import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cxui/cxui.dart';
import 'package:video_player/video_player.dart';

// todo
// timeRatio: follow screen width;

class CxPlayer extends StatefulWidget {
  const CxPlayer({super.key});

  @override
  State<CxPlayer> createState() => _CxPlayerState();
}

class _CxPlayerState extends State<CxPlayer> {
  bool isPlayed = false;
  double? progressValue = 0; //play progress

  int seconds = 0; //总时间
  int seconding = 0; //当前时间
  double timeRatio = 1;
  double ratio = 1;

  bool isFull = false;

  VideoPlayerController controller = VideoPlayerController.networkUrl(Uri.parse(
      "https://s5.bfbfvip.com/video/minglongshaonian/%E7%AC%AC01%E9%9B%86/index.m3u8"));
  // VideoPlayerController controller = VideoPlayerController.networkUrl(Uri.parse(
  //     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
  // VideoPlayerController? controller;
  // final FijkPlayer player = FijkPlayer();
  // Create a [Player] to control playback.
  // late final player = Player();
  // Create a [VideoController] to handle video output from [Player].
  // late final controller = VideoController(player);
  @override
  void initState() {
    // TODO: implement initState
    controller.initialize().then((v) {
      final value = controller.value;
      final width = MediaQuery.sizeOf(context).width;
      setState(() {
        seconds = value.duration.inSeconds;
        print(seconds);
        timeRatio = width / seconds;
        ratio = value.size.width / value.size.height;
      });
    });

    controller.addListener(() {
      final pos = controller.value.position;
      // print("hello: ${pos.inSeconds} ${ratio} ${width}");
      setState(() {
        seconding = pos.inSeconds;
        progressValue = timeRatio * seconding;
      });
    });
    // controller = VideoPlayerController.asset("/assets/video/test.ts")
    //   ..initialize().then((value) => {print("hello, player")});

    // controller = VideoPlayerController.networkUrl(Uri.parse(
    //     "https://vip.ffzy-online1.com/20230829/43081_0688f9c3/index.m3u8"));
    // controller!.initialize().then((value) {
    //   print("test");
    // });

    // player
    //     .open(Media(
    //         "https://vip.ffzy-online1.com/20230829/43081_0688f9c3/index.m3u8"))
    //     .then((value) => null);

    super.initState();
  }

  void clickPlay() {
    !isPlayed ? controller.play() : controller.pause();
    setState(() {
      isPlayed = !isPlayed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: w / ratio,
      width: w,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black,
              child: VideoPlayer(controller),
            ),
          ),
          Positioned(
            child: Center(
              child: CxButton(
                type: CxButtonType.fill,
                radius: 60,
                width: 60,
                height: 60,
                color: Colors.white.withAlpha(150),
                iconColor: Colors.white.withAlpha(200),
                padding: const EdgeInsets.all(0),
                icon: !isPlayed ? Icons.play_circle : Icons.pause_circle,
                iconSize: 50,
                onTap: () {
                  clickPlay();
                  // player.seek(const Duration(seconds: 10));
                },
              ),
            ),
          ),
          playActions()
        ],
      ),
    );
  }

  Widget playActions() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      // height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CxProgress(
              onProgress: (value) {
                controller
                    .seekTo(Duration(seconds: (value / timeRatio).ceil()));
              },
              progress: progressValue ?? 0,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CxButton(
                      padding: const EdgeInsets.all(0),
                      icon: isPlayed ? Icons.pause_circle : Icons.play_circle,
                      color: Colors.white,
                      iconSize: 30,
                      onTap: () {
                        clickPlay();
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    PlayTime(total: seconds, progress: seconding),
                  ],
                ),
                Row(children: [
                  CxIconButton(
                    click: () {
                      if (!isFull) {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.landscapeLeft,
                          DeviceOrientation.landscapeRight,
                        ]);
                      } else {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                          DeviceOrientation.portraitDown,
                        ]);
                      }
                      setState(() {
                        isFull = !isFull;
                      });
                    },
                    icon: isFull ? Icons.fullscreen_exit : Icons.fullscreen,
                    size: 30,
                    color: Colors.white,
                    focusColor: Colors.white,
                    // hoverColor: Colors.white,
                    clickColor: Colors.white.withAlpha(100),
                  )
                ])
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // controller!.dispose();
    // player.dispose();
    super.dispose();
  }
}

const playTimeStyle = TextStyle(color: Colors.white);

class PlayTime extends StatelessWidget {
  const PlayTime({
    super.key,
    this.total = 0,
    this.progress = 0,
  });
  final int total;
  final int progress;

  String time(int seconds) {
    int minu = seconds ~/ 60;
    int sec = seconds % 60;
    final minuStr = minu < 10 ? "0$minu" : "$minu";
    final secStr = sec < 10 ? "0$sec" : "$sec";

    return "$minuStr:$secStr";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          time(progress),
          style: playTimeStyle,
        ),
        const Text(
          " / ",
          style: playTimeStyle,
        ),
        Text(
          time(total),
          style: playTimeStyle,
        ),
      ],
    );
  }
}
