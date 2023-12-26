import 'package:flutter/material.dart';

import 'package:flutter_cxui/cxui.dart';

void main() {
  runApp(const PagePlayerApp());
}

class PagePlayerApp extends StatelessWidget {
  const PagePlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purpleAccent[50],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          title: const Text("CxPlayer"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              // color: Colors.black,
              padding: const EdgeInsets.all(20),
              child: const Column(
                children: [CxPlayer()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
