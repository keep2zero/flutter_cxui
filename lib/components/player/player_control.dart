import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cxui/components/player/player_handle.dart';
import 'package:flutter_cxui/cxui.dart';

class PlayerControl extends StatefulWidget {
  const PlayerControl({
    super.key,
    required this.controller,
    this.isFull = false,
    this.seconds = 0,
    this.seconding = 0,
    this.progress = 0,
    this.ratio = 1,
    this.isShow = true,
    this.isCenter = false,
    this.played = false,
    required this.onPlayed,
    this.onNext,
  });

  final PlayerHandler controller;
  final bool isFull;
  final int seconds;
  final int seconding;
  final double progress;
  final double ratio;
  final bool isShow;
  final bool isCenter;
  final bool played;
  final void Function(bool) onPlayed;
  final void Function()? onNext;
  @override
  State<PlayerControl> createState() => _PlayerControlState();
}

class _PlayerControlState extends State<PlayerControl> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isShow ? buildBody() : Container();
  }

  Container buildBody() {
    return Container(
      child: Stack(
        children: [
          if (widget.isCenter)
            Positioned.fill(
              bottom: 50,
              child: Center(
                child: CxButton(
                  type: CxButtonType.fill,
                  radius: 50,
                  width: 50,
                  height: 50,
                  color: Colors.white.withAlpha(150),
                  iconColor: Colors.white.withAlpha(200),
                  padding: const EdgeInsets.all(0),
                  icon: widget.played ? Icons.pause_circle : Icons.play_circle,
                  iconSize: 50,
                  onTap: () {
                    clickPlay();
                    // player.seek(const Duration(seconds: 10));
                  },
                ),
              ),
            ),
          playActions(),
        ],
      ),
    );
  }

  ///
  Widget playActions() {
    final controller = widget.controller;
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
              height: 5,
              range: 20,
              onProgress: (value) {
                controller
                    .seekTo(Duration(seconds: (value / widget.ratio).ceil()));
              },
              progress: widget.progress,
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
                      icon: widget.played
                          ? Icons.pause_circle
                          : Icons.play_circle,
                      color: Colors.white,
                      iconSize: 30,
                      onTap: () {
                        clickPlay();
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    if (widget.onNext != null)
                      CxButton(
                        onTap: () {
                          widget.onNext!();
                        },
                        type: CxButtonType.text,
                        icon: Icons.skip_next,
                        iconSize: 30,
                        padding: const EdgeInsets.all(0),
                        color: Colors.white,
                      ),
                    const SizedBox(width: 10),
                    PlayTime(total: widget.seconds, progress: widget.seconding),
                  ],
                ),
                Row(children: [
                  CxIconButton(
                    click: () {
                      Orientation direct = MediaQuery.of(context).orientation;
                      if (direct == Orientation.portrait) {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.landscapeLeft,
                          DeviceOrientation.landscapeRight,
                        ]);
                        // isFull = true;
                      } else {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                          DeviceOrientation.portraitDown,
                        ]);
                        // isFull = false;
                      }
                      // if (widget.onFullScreen != null)
                      //   widget.onFullScreen!(!isFull);
                      // setState(() {

                      // });
                    },
                    icon: widget.isFull
                        ? Icons.fullscreen_exit
                        : Icons.fullscreen,
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

  void clickPlay() {
    final controller = widget.controller;
    !widget.played ? controller.play() : controller.pause();

    widget.onPlayed(!widget.played);
    // setState(() {
    //   isPlayed = !isPlayed;
    // });
  }
}

///////////
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
