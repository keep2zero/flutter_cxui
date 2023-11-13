import 'package:flutter/material.dart';

import '../components/select_button_list/select_button_list.dart';

class PageSelectButtonList extends StatefulWidget {
  const PageSelectButtonList({super.key});

  @override
  State<PageSelectButtonList> createState() => _PageSelectButtonListState();
}

class _PageSelectButtonListState extends State<PageSelectButtonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Button List"),
      ),
      body: CxSelectButtonList(
        hasTopRight: [2, 3, 4, 5, 6, 7, 8],
        topRight: Icon(
          Icons.grade_rounded,
          color: Colors.amber,
          size: 16,
        ),
        boxColor: Colors.transparent,
        bgColor: Colors.blueAccent,
        size: 50,
        data: const <String>["1", "2", "3", "4", "5", "6", "7", "8", "9"],
        onChange: (index, item) {
          print("$index $item");
        },
      ),
    );
  }
}
