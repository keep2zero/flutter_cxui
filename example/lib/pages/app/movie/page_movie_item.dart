import 'package:flutter/material.dart';
import 'package:flutter_cxui/cxui.dart';

import '../../../config.dart';

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
            const CxTitleNav(
              items: ["详情", "看点", "讨论"],
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
            const CxTitleNav(
              items: ["选集"],
              selectSize: 16,
            ),

            CxSelectButtonList(
              bgColor: CxConfig.primary,
              selectBgColor: CxConfig.highlight,
              data: const ["1", "2", "3", "4", "5", "6"],
              hasTopRight: const [3, 4, 5],
              onChange: (index, item) {},
              topRight: Container(
                margin: const EdgeInsets.only(top: 8, right: 8),
                padding: const EdgeInsets.only(
                  left: 2,
                  right: 2,
                  bottom: 2,
                  top: 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.amberAccent[700],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                ),
                child: const Text(
                  "VIP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 6,
                  ),
                ),
                // color: Colors.amber,
              ),
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
                    return const SizedBox(
                      width: 160,
                      height: 120,
                      child: CxImageCard(
                        title: "您好",
                        img: "assets/img/card-img-01.jpg",
                      ),
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
