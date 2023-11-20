import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/card/card.dart';
import 'package:flutter_cxui/config.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CxCard(
              margin: const EdgeInsets.all(10),
              radius: 15,
              shadow: true,
              title: "默认",
              body: Container(
                child: defaultList(),
              ),
            ),
            CxCard(
              margin: const EdgeInsets.all(10),
              radius: 15,
              shadow: true,
              title: "颜色",
              body: Container(
                child: normalList(),
              ),
            ),
            CxCard(
              margin: const EdgeInsets.all(10),
              radius: 15,
              shadow: true,
              title: "带右上角",
              body: Container(
                child: starList(),
              ),
            ),
            CxCard(
              margin: const EdgeInsets.all(10),
              radius: 15,
              shadow: true,
              title: "多文字的",
              body: Container(
                child: multiList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CxSelectButtonList starList() {
    return CxSelectButtonList(
      hasTopRight: const [2, 3, 4, 5, 6, 7, 8],
      topRight: Icon(
        Icons.grade_rounded,
        color: CxConfig.highlight,
        size: 16,
      ),
      boxColor: Colors.transparent,
      bgColor: CxConfig.primary.withAlpha(200),
      selectBgColor: CxConfig.primary,
      size: 50,
      data: const <String>["1", "2", "3", "4", "5", "6", "7", "8", "9"],
      onChange: (index, item) {
        // print("$index $item");
      },
    );
  }

  CxSelectButtonList normalList() {
    return CxSelectButtonList(
      boxColor: Colors.transparent,
      bgColor: CxConfig.primary.withAlpha(200),
      selectBgColor: CxConfig.primary,
      size: 50,
      data: const <String>["1", "2", "3", "4", "5", "6", "7", "8", "9"],
      onChange: (index, item) {
        // print("$index $item");
      },
    );
  }

  CxSelectButtonList defaultList() {
    return CxSelectButtonList(
      size: 50,
      data: const <String>["1", "2", "3", "4", "5", "6", "7", "8", "9"],
      onChange: (index, item) {
        // print("$index $item");
      },
    );
  }

  CxSelectButtonList multiList() {
    return CxSelectButtonList(
      data: const <String>["1 中文说唱巅峰", "2", "3", "4", "5", "6", "7", "8", "9"],
      onChange: (index, item) {
        // print("$index $item");
      },
    );
  }
}
