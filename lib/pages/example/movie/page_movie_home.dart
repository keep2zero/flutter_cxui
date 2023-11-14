import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/card/card.dart';
import 'package:flutter_cxui/components/icon_button/icon_button.dart';
import 'package:flutter_cxui/components/image_card/image_card.dart';
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
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
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
          CxSliderView(
            onTap: (SliderObject obj, int index) {
              Navigator.of(context).pushNamed("/app/movie/item");
            },
            objects: [
              SliderObject("海豹看看",
                  "https://puui.qpic.cn/vcover_hz_pic/0/mzc00200q7mndle1664438925875/332?max_age=7776001"),
              SliderObject("故宫里的大怪兽之莫奈何的谜题",
                  "https://puui.qpic.cn/vcover_hz_pic/0/mzc00200ap8s2p31697455490020/332?max_age=7776001"),
              SliderObject("小不点.....",
                  "https://puui.qpic.cn/vpic_cover/m0038bibwlq/m0038bibwlq_hz.jpg/640"),
            ],
          ),
          buildList(context),
          buildEnd(context),
        ],
      ),
    );
  }

  Widget buildList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      child: GridView.builder(
        controller: null,
        shrinkWrap: true,
        itemCount: 6,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return const CxImageCard(
        title: "hello", subtitle: "test", img: "assets/img/card-img-01.jpg");
  }

  Widget buildEnd(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (ctx, inx) {
        return const SizedBox(
          height: 200,
          child: CxImageCard(
            title: "您好",
            subtitle: "是什么",
            img: "assets/img/card-img-01.jpg",
          ),
        );
      },
    );
  }
}
