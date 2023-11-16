import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/card/card.dart';
import 'package:flutter_cxui/components/icon_button/icon_button.dart';
import 'package:flutter_cxui/config.dart';

class PageCard extends StatefulWidget {
  const PageCard({super.key});

  @override
  State<PageCard> createState() => _PageCardState();
}

class _PageCardState extends State<PageCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CxCard(
              margin: EdgeInsets.all(10),
              title: "默认",
              body: Text("hello"),
            ),
            CxCard(
              bgColor: CxConfig.primary,
              hdBgColor: CxConfig.white.withAlpha(90),
              titleColor: CxConfig.white,
              margin: EdgeInsets.all(10),
              title: "颜色",
              body: Text("hello"),
            ),
            CxCard(
              shadow: true,
              bgColor: CxConfig.primary,
              hdBgColor: CxConfig.white.withAlpha(90),
              titleColor: CxConfig.white,
              margin: EdgeInsets.all(10),
              title: "Shadow",
              body: Text("hello"),
            ),
            CxCard(
              shadow: true,
              radius: 16,
              bgColor: CxConfig.primary,
              hdBgColor: CxConfig.white.withAlpha(90),
              titleColor: CxConfig.white,
              margin: EdgeInsets.all(10),
              title: "Shadow And Radius",
              body: Text("hello"),
            ),
            buildActions(),
          ],
        ),
      ),
    );
  }

  CxCard buildActions() {
    return CxCard(
      shadow: true,
      radius: 16,
      bgColor: CxConfig.primary,
      hdBgColor: CxConfig.white.withAlpha(90),
      titleColor: CxConfig.white,
      margin: EdgeInsets.all(10),
      title: "Actions",
      actions: [
        CxIconButton(
          icon: Icons.arrow_circle_right_outlined,
          color: CxConfig.white,
          size: 18,
        )
      ],
      body: Text("hello"),
    );
  }
}
