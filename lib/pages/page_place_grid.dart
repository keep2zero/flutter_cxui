import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/card/card.dart';
import 'package:flutter_cxui/components/place_grid/place_grid.dart';

class PagePlaceGrid extends StatelessWidget {
  const PagePlaceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("宫格")),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            card01(),
            SizedBox(
              height: 20,
            ),
            card01(),
          ],
        ),
      ),
    );
  }

  CxCard card01() {
    return CxCard(
      title: "宫格例子",
      body: CxPlaceGrid(
        // height: 20,
        //  ratio: 1,
        cols: 4,
        items: [
          PlaceGridItem(
              icon: Icons.list_alt,
              title: "预约 | 加追",
              iconSize: 28,
              color: Colors.white),
          PlaceGridItem(
            icon: Icons.download_for_offline_outlined,
            title: "我的下载",
            iconSize: 28,
            color: Colors.orange,
          ),
          PlaceGridItem(
            icon: Icons.video_collection_outlined,
            title: "我的片单",
            iconSize: 28,
            color: Colors.purple,
          ),
          PlaceGridItem(
            icon: Icons.star_border,
            title: "我的收藏",
            color: Colors.pink,
            iconSize: 28,
          ),
        ],
      ),
    );
  }
}
