import 'package:flutter/material.dart';
import 'package:flutter_cxui/cxui.dart';

void main(List<String> args) {
  runApp(const PageCxscrollviewApp());
}

class PageCxscrollviewApp extends StatelessWidget {
  const PageCxscrollviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageCxscrollview(),
    );
  }
}

class PageCxscrollview extends StatefulWidget {
  const PageCxscrollview({super.key});

  @override
  State<PageCxscrollview> createState() => _PageCxscrollviewState();
}

class _PageCxscrollviewState extends State<PageCxscrollview> {
  int count = 10;

  @override
  Widget build(BuildContext context) {
    return CxScrollView(
      isLoadingIcon: false,
      loadingText: "加载中...",
      onTimeout: () {
        print("timeout");
      },
      onLoad: () {
        print("loading......");
        Future.delayed(const Duration(seconds: 8), () {
          setState(() {
            count += 10;
          });
        });
      },
      child: ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: index % 2 == 0 ? Colors.amber : Colors.purple,
            height: 200,
            child: const Placeholder(),
          );
        },
      ),
    );
  }
}
