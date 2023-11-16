import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/card/card.dart';
import 'package:flutter_cxui/components/title_nav/title_nav.dart';
import 'package:flutter_cxui/config.dart';

class PageTitleNav extends StatelessWidget {
  const PageTitleNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title Nav"),
      ),
      body: Column(
        children: [
          buildDefault(),
          buildColor(),
          buildSize(),
        ],
      ),
    );
  }

  CxCard buildDefault() {
    return const CxCard(
      radius: 16,
      margin: EdgeInsets.all(8),
      shadow: true,
      title: "默认",
      body: CxTitleNav(
        items: ["首页", "电视剧", "电影", "综艺", "动漫", "少儿", "体育", "纪录片"],
      ),
    );
  }

  CxCard buildColor() {
    return CxCard(
      radius: 16,
      margin: const EdgeInsets.all(8),
      shadow: true,
      title: "自定义颜色",
      body: CxTitleNav(
        color: CxConfig.primary,
        selectColor: CxConfig.highlight,
        items: const ["首页", "电视剧", "电影", "综艺", "动漫", "少儿", "体育", "纪录片"],
      ),
    );
  }

  CxCard buildSize() {
    return CxCard(
      radius: 16,
      margin: const EdgeInsets.all(8),
      shadow: true,
      title: "自定义大小",
      body: CxTitleNav(
        size: 12,
        selectSize: 16,
        color: CxConfig.primary,
        selectColor: CxConfig.highlight,
        items: const ["首页", "电视剧", "电影", "综艺", "动漫", "少儿", "体育", "纪录片"],
      ),
    );
  }
}
