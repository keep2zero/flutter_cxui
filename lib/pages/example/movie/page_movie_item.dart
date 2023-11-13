import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/card/card.dart';
import 'package:flutter_cxui/components/image_card/image_card.dart';
import 'package:flutter_cxui/components/select_button_list/select_button_list.dart';
import 'package:flutter_cxui/components/title_nav/title_nav.dart';

class PageMovieItem extends StatelessWidget {
  const PageMovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Placeholder(
              fallbackHeight: 200,
            ),
            CxTitleNav(
              items: const ["详情", "看点", "讨论"],
              selectSize: 16,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "梅府有女初成长",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "简介 >",
                  style: TextStyle(fontSize: 12, color: Colors.white38),
                ),
              ],
            ),

            //
            CxTitleNav(
              items: const ["选集"],
              selectSize: 16,
            ),

            CxSelectButtonList(
              data: const ["1", "2", "3", "4", "5", "6"],
              onChange: (index, item) {},
            ),

            //

            CxCard(
              margin: const EdgeInsets.all(8),
              radius: 8,
              bgColor: Colors.transparent,
              title: "推荐电影",
              subtitle: "hello",
              actions: const [
                Icon(Icons.hot_tub, color: Colors.amber),
              ],
              body: SizedBox(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 160,
                      height: 120,
                      child: CxImageCard(title: "您好"),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
