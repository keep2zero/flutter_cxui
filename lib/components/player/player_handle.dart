import 'package:video_player/video_player.dart';

class PlayerHandler {
  VideoPlayerController? controller;
  void Function(VideoPlayerController, void)? completed;
  void Function(VideoPlayerController)? listener;
  void Function(VideoPlayerController)? create;
  PlayerHandler open(String url) {
    if (controller != null) controller!.dispose();
    controller = VideoPlayerController.networkUrl(Uri.parse(url));
    if (create != null) create!(controller!);
    controller!.addListener(() {
      listener!(controller!);
    });

    controller!.initialize().then((value) {
      completed!(controller!, value);
    });
    return this;
  }

  PlayerHandler addCreate(void Function(VideoPlayerController) fn) {
    create = fn;
    return this;
  }

  PlayerHandler addComplete(void Function(VideoPlayerController, void) callbk) {
    completed = callbk;
    return this;
  }

  PlayerHandler addListener(void Function(VideoPlayerController) callbk) {
    listener = callbk;
    return this;
  }

  void seekTo(Duration position) {
    if (controller != null) controller!.seekTo(position);
  }

  void play() {
    if (controller != null) controller!.play();
  }

  void pause() {
    if (controller != null) controller!.pause();
  }

  void dispose() {
    if (controller != null) controller!.dispose();
  }
}
