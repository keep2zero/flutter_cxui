import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/utils.dart';
import 'package:flutter_cxui/cxui.dart';

import 'mode/chat_data.dart';

void main() {
  runApp(const PageChatApp());
}

class PageChatApp extends StatefulWidget {
  const PageChatApp({super.key});

  @override
  State<PageChatApp> createState() => _PageChatAppState();
}

class _PageChatAppState extends State<PageChatApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 235, 235),
        appBar: AppBar(
          title: const Text("Chat View"),
        ),
        body: ListView.builder(
          itemCount: chatData.length,
          itemBuilder: (context, index) {
            var item = chatData[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CxChatView(
                onPress: (item, {extra}) {
                  if (item.type == "image" || FileUtil.isImage(item.url ?? "") || FileUtil.isImage(item.message ?? "")) {
                    log("image");
                  }
                },
                menuHeight: 60,
                defaultAvatar: "assets/img/cx-logo.png",
                data: item,
                isDirect: item.name == "word",
                contentMenus: [
                  IconButton(
                      onPressed: () {
                        int size = item.loadingSize ?? 0;
                        Timer.periodic(Duration(seconds: 1), (t) {
                          if (item.size == null) {
                            return;
                          }
                          log("hello size: ${item.loadingSize}");
                          size = size + 10;
                          item.loadingSize = size;
                          setState(() {});
                          if (item.loadingSize! >= item.size!) {
                            t.cancel();
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.white,
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
