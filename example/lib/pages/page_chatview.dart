import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/utils.dart';
import 'package:flutter_cxui/cxui.dart';

import 'mode/chat_data.dart';

void main() {
  runApp(const PageChatApp());
}

class PageChatApp extends StatelessWidget {
  const PageChatApp({super.key});

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
            final item = chatData[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CxChatView(
                onPress: (item) {
                  if (item.type == "image" ||
                      FileUtil.isImage(item.url ?? "") ||
                      FileUtil.isImage(item.message ?? "")) {
                    log("image");
                  }
                },
                data: item,
                isDirect: item.name == "word",
                contentMenus: [
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
