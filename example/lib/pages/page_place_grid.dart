import 'package:flutter/material.dart';
import 'package:flutter_cxui/cxui.dart';

import '../config.dart';
import '../data/place_grid_data.dart';

class PagePlaceGrid extends StatelessWidget {
  const PagePlaceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("宫格")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CxCard(
                shadow: true,
                shadowColor: CxConfig.primary.withAlpha(30),
                bgColor: CxConfig.white,
                radius: 16,
                body: CxPlaceGrid(
                  height: 60,
                  cols: 4,
                  items: pgi_01,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              pg02(),
            ],
          ),
        ),
      ),
    );
  }

  CxCard pg02() {
    return CxCard(
      // minHeight: 200,
      radius: 16,
      hdBgColor: CxConfig.white,
      hdPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      bgColor: CxConfig.white,
      hdSplit: true,
      hdSplitMargin: const EdgeInsets.symmetric(horizontal: 16),
      title: "更多功能",

      actions: [
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: CxConfig.primary.withAlpha(160),
          size: 16,
        ),
      ],
      body: CxPlaceGrid(
        height: 130,
        cols: 4,
        items: pgi_02,
      ),
    );
  }
}
