import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/player/player_handle.dart';

import 'package:flutter_cxui/cxui.dart';

void main() {
  runApp(const PagePlayerApp());
}

class PagePlayerApp extends StatefulWidget {
  const PagePlayerApp({super.key});

  @override
  State<PagePlayerApp> createState() => _PagePlayerAppState();
}

class _PagePlayerAppState extends State<PagePlayerApp> {
  bool isFull = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purpleAccent[50],
        appBar: (!isFull)
            ? AppBar(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                title: const Text("CxPlayer"),
              )
            : null,
        body: Container(
          color: Colors.black,
          // padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: CxPlayer(
                  handler: PlayerHandler(),
                  url:
                      "https://s5.bfbfvip.com/video/minglongshaonian/%E7%AC%AC03%E9%9B%86/index.m3u8",
                  onFullScreen: (value) {
                    print("the fullscreen: $value");
                    setState(() {
                      isFull = value;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
