// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_cxui/components/card/card.dart';
import 'package:flutter_cxui/cxui.dart';
import 'package:ionicons/ionicons.dart';

import '../../../config.dart';

class PageMovieHome extends StatefulWidget {
  const PageMovieHome({super.key});

  @override
  State<PageMovieHome> createState() => _PageMovieHomeState();
}

class _PageMovieHomeState extends State<PageMovieHome> {
  final _colors = [
    Colors.purple,
    Colors.green,
    Colors.pink,
    Colors.orange,
    Colors.red,
    Colors.blue,
    Colors.amber,
    Colors.cyan,
    Colors.brown,
    Colors.teal
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors[index],
      appBar: AppBar(
        backgroundColor: _colors[index],
        centerTitle: true,
        actions: [
          Icon(
            Ionicons.game_controller,
            color: Colors.white.withAlpha(200),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white.withAlpha(200),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CxButton(
              padding: const EdgeInsets.all(6),
              color: Colors.white.withAlpha(50),
              type: CxButtonType.fill,
              text: "追",
              icon: Icons.menu,
            ),
          ),
        ),
        title: buildSearchbar(),
      ),
      body: buildBody(context),
    );
  }

  Container buildSearchbar() {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(
        left: 0,
        top: 6,
        bottom: 6,
        right: 10,
      ),
      child: TextField(
        style: const TextStyle(fontSize: 12),
        maxLines: 1,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(230),
            gapPadding: 0,
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(230),
            gapPadding: 0,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white.withAlpha(150),
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white.withAlpha(150),
          isDense: true,
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.03, 0.1],
            tileMode: TileMode.decal,
            colors: [
              _colors[index],
              CxConfig.white,
            ],
          ),
        ),
        child: Column(
          children: [
            CxTitleNav(
              onChange: (int ix) {
                setState(() {
                  index = ix;
                });
              },
              color: Colors.white.withAlpha(160),
              selectColor: Colors.white,
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
          childAspectRatio: 1.2,
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return const CxImageCard(
      title: "hello",
      subtitle: "test",
      img: "assets/img/card-img-01.jpg",
    );
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
