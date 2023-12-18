import 'dart:io';

// import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cxui/cxui.dart';

class CxPlayer extends StatefulWidget {
  const CxPlayer({super.key});

  @override
  State<CxPlayer> createState() => _CxPlayerState();
}

class _CxPlayerState extends State<CxPlayer> {
  // VideoPlayerController controller = VideoPlayerController.networkUrl(Uri.parse(
  // "https://vip.ffzy-online1.com/20230829/43081_0688f9c3/index.m3u8"));
  // VideoPlayerController? controller;
  // final FijkPlayer player = FijkPlayer();
  // Create a [Player] to control playback.
  // late final player = Player();
  // Create a [VideoController] to handle video output from [Player].
  // late final controller = VideoController(player);
  @override
  void initState() {
    // TODO: implement initState
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CxButton(
          text: "播放",
          onTap: () {
            // player.seek(const Duration(seconds: 10));
          },
        ),
        Container(
          height: 300,
          color: Colors.black,
          // child: Video(controller: controller),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // controller!.dispose();
    // player.dispose();
    super.dispose();
  }
}
