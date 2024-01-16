import 'package:flutter/material.dart';
import 'package:flutter_cxui/cxui.dart';

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
        appBar: AppBar(
          title: const Text("Chat View"),
        ),
        body: CxChatView(),
      ),
    );
  }
}
