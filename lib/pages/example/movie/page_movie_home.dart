import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/icon_button/icon_button.dart';
import 'package:flutter_cxui/components/slider_view/slider_view.dart';
import 'package:flutter_cxui/components/title_nav/title_nav.dart';

class PageMovieHome extends StatelessWidget {
  const PageMovieHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          CxIconButton(
            icon: Icons.gamepad_outlined,
            size: 28,
          ),
          const SizedBox(
            width: 10,
          ),
          CxIconButton(
            icon: Icons.card_travel,
            size: 28,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        title: const Text("辰汐电视"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        children: [
          CxTitleNav(
            select: 1,
            items: const [
              "NBA",
              "首页",
              "电视剧",
              "动漫",
              "电影",
              "综艺节目",
              "少儿",
              "专题",
              "奥运"
            ],
          ),
          CxSliderView()
        ],
      ),
    );
  }
}
