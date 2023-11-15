import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/card/card.dart';
import 'package:flutter_cxui/components/place_grid/place_grid.dart';
import 'package:flutter_cxui/config.dart';
import 'package:flutter_cxui/data/place_grid_data.dart';

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
            CxCard(
              bgColor: CxConfig.white,
              radius: 16,
              body: CxPlaceGrid(
                cols: 4,
                items: pgi_01,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CxCard(
              radius: 16,
              hdBgColor: CxConfig.white,
              bgColor: CxConfig.white,
              title: "更多功能",
              body: CxPlaceGrid(
                cols: 4,
                items: pgi_02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
