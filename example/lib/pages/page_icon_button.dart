import 'package:flutter/material.dart';

import 'package:flutter_cxui/cxui.dart';

import '../config.dart';
import '../data/icon_button_data.dart';
// import 'package:ionicons/ionicons.dart';

class PageIconButton extends StatelessWidget {
  const PageIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon Button"),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        buildCard01(),
        buildCard02(),
      ],
    );
  }

  Widget buildCard01() {
    return CxCard(
      shadow: true,
      radius: 10,
      hdPadding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      bgColor: CxConfig.white,
      hdBgColor: CxConfig.white,
      title: "默认",
      hdSplit: true,
      body: Wrap(
        children: cxiconlist
            .map(
              (e) => Container(
                margin: const EdgeInsets.all(10),
                child: CxIconButton(
                  icon: e,
                  size: 26,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildCard02() {
    return CxCard(
      shadow: true,
      radius: 10,
      hdPadding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      bgColor: CxConfig.white,
      hdBgColor: CxConfig.white,
      title: "背景",
      hdSplit: true,
      body: Wrap(
        children: cxiconlist
            .map(
              (e) => Container(
                margin: const EdgeInsets.all(10),
                child: CxIconButton(
                  icon: e,
                  size: 24,
                  bgColor: CxConfig.primary,
                  color: CxConfig.white,
                  focusColor: CxConfig.highlight.withAlpha(200),
                  hoverColor: CxConfig.highlight,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
